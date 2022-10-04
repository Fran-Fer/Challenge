//
//  MainPresenter.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation
import UIKit

// MARK: Main Presenter
class MainPresenter: MainPresenterProtocol {
  // MARK: - Main Presenter Properties
  var interactor: MainInteractorProtocol?
  var router: MainRouterProtocol?
  var view: MainViewProtocol?
  private let mealList: [Meal] = []
  
  // MARK: - Main Presenter Methods
  func fetchParsedData() {
    interactor?.getData()
  }
  
  func didFetchRecipeData(with result: MealList) {
    view?.updateView(withData: result)
  }
  
  func failedToFetchData() {
    if let view = view {
      router?.parseError(view: view)
    } else {
      preconditionFailure("View could not be assigned")
    }
  }
  
  func sendToDishDetail(with id: String, view: UINavigationController) {
    router?.presentDishDetail(view: view, id: id)
  }
}
