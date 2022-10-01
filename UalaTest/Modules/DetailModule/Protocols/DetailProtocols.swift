//
//  DetailProtocols.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation
import UIKit

// MARK: Detail View Protocol
protocol DetailViewProtocol: UIViewController {
  var presenter: DetailPresenterProtocol? { get set }
  func updateUI()
}

// MARK: Detail Interactor Protocol
protocol DetailInteractorProtocol: AnyObject {
  var presenter: DetailPresenterProtocol? { get set }
}

// MARK: Detail Presenter Protocol
protocol DetailPresenterProtocol: AnyObject {
  var interactor: DetailInteractorProtocol? { get set }
  var router: DetailRouterProtocol? { get set }
  var view: DetailViewProtocol? { get set }
}

// MARK: Detail Router Protocol
protocol DetailRouterProtocol: AnyObject {
  func present(navigationController: UINavigationController)
}

// MARK: Detail Builder Protocol
protocol DetailBuilderProtocol: AnyObject {
  func build(router: DetailRouter) -> DetailViewController
}
