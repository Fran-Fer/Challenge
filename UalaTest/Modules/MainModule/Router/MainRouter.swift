//
//  MainRouter.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation
import UIKit

// MARK: Main Router
class MainRouter: MainRouterProtocol {
  var navigationController: UINavigationController?
  
  // MARK: - Router Methods
  func presentMainModule(in window: UIWindow) {
    window.makeKeyAndVisible()
    let viewController: MainViewController = MainBuilder().build(router: self)
    navigationController = UINavigationController(rootViewController: viewController)
    window.rootViewController = navigationController
  }
  
  func presentDishDetail(view: UINavigationController, id: String) {
    //DetailRouter().present(navigationController: view, data: id)
  }
  
  func parseError(view: MainViewProtocol) {
    DispatchQueue.main.async {
      view.displayError()
    }
  }
}
