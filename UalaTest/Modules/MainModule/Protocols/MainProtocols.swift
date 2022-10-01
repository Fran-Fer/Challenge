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
  func fetchCVData(_ completion: @escaping (Result<Recipe, Error>) -> Void)
}

// MARK: - Main View Protocol
protocol MainViewProtocol: UIViewController {
  var presenter: MainPresenterProtocol? { get set }
  func updateView(withData: Recipe)
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
  func didFetchCVData(with result: Recipe)
  func failedToFetchData()
  func sendTo(with data: Recipe, identifier: String)
}

// MARK: - Main Router Protocol
protocol MainRouterProtocol: AnyObject {
  func presentDishDetail(view: MainViewProtocol, data: Recipe)
  func parseError(view: MainViewProtocol)
  func presentMainModule(in window: UIWindow)
}
