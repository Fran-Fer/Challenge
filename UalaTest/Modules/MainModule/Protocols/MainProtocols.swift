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
  func fetchRecipeData(isRandom: Bool, completion: @escaping (Result<MealList, Error>) -> Void)
  func fetchImage(url: URL, completion: @escaping (Data?, Error?) -> Void)
}

// MARK: - Main View Protocol
protocol MainViewProtocol: UIViewController {
  var presenter: MainPresenterProtocol? { get set }
  func updateView(withData: MealList)
  func updateBanner(data: Data)
  func reloadTableView() 
  func displayError()
}

// MARK: - Main Interactor Protocol
protocol MainInteractorProtocol: AnyObject {
  var presenter: MainPresenterProtocol? { get set }
  var apiDataManager: MainDataManagerProtocol? { get set }
  func getData()
  func getThumbImage(url: URL)
  func getRandomRecipe()
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
  func fetchThumbImage(url: URL)
  func didFetchThumbImage(url: URL, data: Data)
  func returnThumbImage(url: URL) -> Data?
  func didFetchRandomImage(url: URL)
  func fetchRandom()
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
