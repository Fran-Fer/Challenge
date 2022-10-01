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
  var presenter: MainPresenterProtocol?
  
  // MARK: - Main View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpNavigationBar()
  }
  
  // MARK: - Main View Private Properties
  private func setUpNavigationBar() {
    view.backgroundColor = .white
    
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = "My Recipes"
    navigationController?.view.backgroundColor = .systemBlue

    navigationController?.navigationBar.isTranslucent = false
    navigationController?.navigationBar.barStyle = .black
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleSearchBar))
    navigationItem.rightBarButtonItem?.tintColor = .white
  }

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
