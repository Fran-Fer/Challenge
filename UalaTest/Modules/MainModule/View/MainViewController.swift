//
//  MainViewController.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation
import UIKit

// MARK: Main View Controller
class MainViewController: UIViewController {
  // MARK: - Main View Properties
  private var loadedData: MealList?
  private var bannerImage: UIImage?
  var presenter: MainPresenterProtocol?
  var recipesTableView: UITableView = UITableView()
  let searchBar: UISearchBar = UISearchBar()
  let banner: UIImageView = UIImageView()
  let activiyIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
  
  // MARK: - Main View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpActivityIndicator()
    presenter?.fetchRandom()
    presenter?.fetchParsedData()
    setUpSearchBar()
    setUpNavigationBar()
    setUpTableView()
    setUpBannerView()
  }

  // MARK: - Main View Private Properties
  private func setUpActivityIndicator() {
    view.addSubview(activiyIndicator)
    recipesTableView.isHidden = true
    banner.isHidden = true
    
    activiyIndicator.isOpaque = true
    activiyIndicator.startAnimating()
    activiyIndicator.backgroundColor = .systemBlue
    activiyIndicator.layer.cornerRadius = 10
    activiyIndicator.hidesWhenStopped = true
    activiyIndicator.color = .white
    activiyIndicator.style = .large
    
    activiyIndicator.translatesAutoresizingMaskIntoConstraints = false
    activiyIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
    activiyIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }
  
  private func setUpSearchBar() {
    searchBar.sizeToFit()
    searchBar.delegate = self
    
    searchBar.searchTextField.backgroundColor = .white
    showSearchBar(shouldShow: true)
  }
  
  private func setUpNavigationBar() {
    view.backgroundColor = .white
    
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = "My Recipes"
    navigationController?.view.backgroundColor = .systemBlue
    navigationController?.view.tintColor = .white
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    navigationController?.navigationBar.barTintColor = .systemBlue
    navigationController?.navigationBar.isTranslucent = false
    navigationController?.navigationBar.barStyle = .black
    
    navigationItem.rightBarButtonItem?.tintColor = .white
  }
  
  private func setUpBannerView() {
    view.addSubview(banner)
    
    banner.translatesAutoresizingMaskIntoConstraints = false
    banner.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10).isActive = true
    banner.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    banner.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    banner.topAnchor.constraint(equalTo: recipesTableView.bottomAnchor, constant: 10).isActive = true
    banner.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
  }
  
  private func setUpTableView() {
    view.addSubview(recipesTableView)
    
    recipesTableView.delegate = self
    recipesTableView.dataSource = self
    recipesTableView.rowHeight = 110
        
    recipesTableView.register(RecipesCell.self, forCellReuseIdentifier: "RecipesCell")
    
    recipesTableView.translatesAutoresizingMaskIntoConstraints = false
    recipesTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    recipesTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    recipesTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    recipesTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    recipesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
    recipesTableView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
  }
  
  private func search(shouldShow: Bool) {
    showSearchBar(shouldShow: !shouldShow)
    searchBar.showsCancelButton = shouldShow
    navigationItem.titleView = shouldShow ? searchBar : nil
  }
  
  private func showSearchBar(shouldShow: Bool) {
    if shouldShow {
      navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                          target: self,
                                                          action: #selector(handleShowSearchBar))
    } else {
      navigationItem.rightBarButtonItem = nil
    }
  }

  // MARK: - Search bar function
  @objc func handleShowSearchBar() {
    searchBar.becomeFirstResponder()
    search(shouldShow: true)
  }

}

extension MainViewController: MainViewProtocol {
  // MARK: - Main View Protocol Methods
  func updateView(withData: MealList) {
    loadedData = withData
    for meal in loadedData?.meals ?? [] {
      guard let mealUrl: URL = meal.strMealThumb else { return }
      presenter?.fetchThumbImage(url: mealUrl)
    }
    reloadTableView()
  }
  
  func updateBanner(data: Data) {
    bannerImage = UIImage(data: data)
    banner.contentMode = .scaleAspectFit
    banner.image = bannerImage
    DispatchQueue.main.async {
      self.activiyIndicator.stopAnimating()
      self.activiyIndicator.removeFromSuperview()
      self.recipesTableView.isHidden = false
      self.banner.isHidden = false
    }
  }
  
  func reloadTableView() {
    DispatchQueue.main.async {
      self.recipesTableView.reloadData()
    }
  }

  func displayError() {
    let alert = UIAlertController(title: "Something Went Wrong", message: "Please try again later", preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Retry", style: UIAlertAction.Style.default, handler: {
      (action: UIAlertAction) in
      self.presenter?.fetchParsedData()
    }))
    self.present(alert, animated: true, completion: nil)
  }
  
  func failedToFetchImage() {
    let alert = UIAlertController(title: "Failed to fetch image", message: "Please try again later", preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Retry", style: UIAlertAction.Style.default, handler: {
      (action: UIAlertAction) in
      self.presenter?.fetchRandom()
    }))
    self.present(alert, animated: true, completion: nil)
  }
}

// MARK: - Table view delegate
extension MainViewController : UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return loadedData?.meals?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesCell", for:  indexPath) as! RecipesCell
    
    guard
      let cellData: Meal = loadedData?.meals?[indexPath.row],
      let cellImageUrl: URL = cellData.strMealThumb
    else { return cell }
    
    cell.display = cellData
    cell.displayImageData = presenter?.returnThumbImage(url: cellImageUrl)
    cell.setUpCell()
    
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard
      let filteredRecipe: Meal = loadedData?.meals?[indexPath.row],
      let filteredRecipeUrl: URL = filteredRecipe.strMealThumb,
      let filteredImage: Data = presenter?.returnThumbImage(url: filteredRecipeUrl),
      let navigationController: UINavigationController = self.navigationController
    else { return }
    presenter?.sendToDishDetail(with: filteredRecipe, imageData: filteredImage, view: navigationController)
  }
}

// MARK: - Search bar delegate
extension MainViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    guard var loadedData: MealList = self.loadedData else { return }
    
    if searchText != "" {
      let filteredMeals: [Meal] = loadedData.meals?.filter( { $0.strMeal?.lowercased().contains(searchText.lowercased()) ?? false } ) ?? []
      loadedData.meals = filteredMeals.sorted { $0.strMeal ?? "" > $1.strMeal ?? "" }
      updateView(withData: loadedData)
    }
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.searchTextField.text = ""
    search(shouldShow: false)
    presenter?.fetchParsedData()
  }
}
