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
  var presenter: MainPresenterProtocol?
  var recipesTableView: UITableView = UITableView()
  
  // MARK: - Main View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.fetchParsedData()
    setUpNavigationBar()
    recipesTableView.delegate = self
    recipesTableView.dataSource = self
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    setUpTableView()
  }
  
  // MARK: - Main View Private Properties
  private func setUpNavigationBar() {
    view.backgroundColor = .white
    
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = "My Recipes"
    navigationController?.view.backgroundColor = .systemBlue
    navigationController?.navigationBar.barTintColor = .systemBlue

    navigationController?.navigationBar.isTranslucent = false
    navigationController?.navigationBar.barStyle = .black
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleSearchBar))
    navigationItem.rightBarButtonItem?.tintColor = .white
  }
  
  private func setUpTableView() {
    view.addSubview(recipesTableView)
    recipesTableView.register(RecipesCell.self, forCellReuseIdentifier: "RecipesCell")
    recipesTableView.frame = view.bounds
  }

  // MARK: - Search bar function
  @objc private func handleSearchBar() {}
}

extension MainViewController: MainViewProtocol {
  // MARK: - Main View Protocol Methods
  func updateView(withData: Recipe) {
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

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10 // TODO: add number of rows according to entity model
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesCell", for:  indexPath) as! RecipesCell
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 110
  }
}

