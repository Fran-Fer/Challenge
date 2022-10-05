//
//  DetailRouter.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation
import UIKit

// MARK: Detail Router
class DetailRouter: DetailRouterProtocol {
  func present(navigationController: UINavigationController, meal: Meal, imageData: Data) {
    navigationController.pushViewController(DetailBuilder().build(router: self, meal: meal, imageData: imageData), animated: true)
  }
}
