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
    view?.updateView(withData: result)
  }
  
  func failedToFetchData() {
    if let view = view {
      router?.parseError(view: view)
    } else {
      preconditionFailure("View could not be assigned")
    }
  }
  
  func sendToDishDetail(with data: Recipe) {
    guard let view = view else { return }
    router?.presentDishDetail(view: view, data: data)
  }
}
