//
//  MainPresenter.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation

// MARK: Main Presenter
class MainPresenter: MainPresenterProtocol {
  // MARK: - Main Presenter Properties
  var interactor: MainInteractorProtocol?
  var router: MainRouterProtocol?
  var view: MainViewProtocol?
  
  // MARK: - Main Presenter Methods
  func fetchParsedData() {
  }
  
  func didFetchRecipeData(with result: Recipe) {
  }
  
  func failedToFetchData() {
  }
  
  func sendTo(with data: Recipe, identifier: String) {
  }
}
