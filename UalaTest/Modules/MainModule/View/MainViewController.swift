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
  private var loadedData: Recipe?
  private var filteredData: Recipe?
  var presenter: MainPresenterProtocol?
  var recipesTableView: UITableView = UITableView()
  let searchBar: UISearchBar = UISearchBar()
  
  // MARK: - Main View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.fetchParsedData()
    setUpSearchBar()
    setUpNavigationBar()
    setUpTableView()

  }
  
  // MARK: - Main View Private Properties
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
  
  private func setUpTableView() {
    view.addSubview(recipesTableView)
    
    recipesTableView.delegate = self
    recipesTableView.dataSource = self
    recipesTableView.rowHeight = 110
        
    recipesTableView.register(RecipesCell.self, forCellReuseIdentifier: "RecipesCell")
    recipesTableView.frame = view.bounds
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
  func updateView(withData: Recipe) {
    DispatchQueue.main.async {
      self.loadedData?.recipiesList = withData.recipiesList
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
}

// MARK: - Table view delegate
extension MainViewController : UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10 // TODO: add number of rows according to entity model
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesCell", for:  indexPath) as! RecipesCell
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard
      let filteredRecipe: RecipiesList = self.filteredData?.recipiesList?[indexPath.row],
      let navigationController: UINavigationController = self.navigationController
    else { return }
    presenter?.sendToDishDetail(with: filteredRecipe, view: navigationController)
  }
}

// MARK: - Search bar delegate
extension MainViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    guard var filteredData: Recipe = self.filteredData else { return }
  
    for word in loadedData?.recipiesList ?? [] {
      if (word.name?.contains(searchText.uppercased()) ?? false) && searchText.count >= 4 {
        filteredData.recipiesList?.append(word)
      }
    }
    updateView(withData: filteredData)
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    //guard let loadedData: Recipe = self.loadedData else { return }
    searchBar.searchTextField.text = ""
    search(shouldShow: false)
    //updateView(withData: loadedData)
  }
}
