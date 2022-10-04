//
//  MainProtocols.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation
import UIKit

// MARK: - Main Data Manager Protocol
protocol MainDataManagerProtocol: AnyObject {
  var network: NetworkingProtocol { get set }
  func fetchRecipeData(_ completion: @escaping (Result<MealList, Error>) -> Void)
}

// MARK: - Main View Protocol
protocol MainViewProtocol: UIViewController {
  var presenter: MainPresenterProtocol? { get set }
  func updateView(withData: MealList)
  func displayError()
}

// MARK: - Main Interactor Protocol
protocol MainInteractorProtocol: AnyObject {
  var presenter: MainPresenterProtocol? { get set }
  var apiDataManager: MainDataManagerProtocol? { get set }
  func getData()
}

// MARK: - Main Presenter Protocol
protocol MainPresenterProtocol: AnyObject {
  var interactor: MainInteractorProtocol? { get set }
  var router: MainRouterProtocol? { get set }
  var view: MainViewProtocol? { get set }
  func fetchParsedData()
  func didFetchRecipeData(with result: MealList)
  func failedToFetchData()
  func sendToDishDetail(with id: String, view: UINavigationController)
}

// MARK: - Main Router Protocol
protocol MainRouterProtocol: AnyObject {
  func presentDishDetail(view: UINavigationController, id: String)
  func parseError(view: MainViewProtocol)
  func presentMainModule(in window: UIWindow)
}

// MARK: - Main Builder Protocol
protocol MainBuilderProtocol: AnyObject {
  func build(router: MainRouterProtocol) -> MainViewController
}
