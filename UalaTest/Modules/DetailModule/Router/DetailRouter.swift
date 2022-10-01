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
  func present(navigationController: UINavigationController, data: RecipiesList) {
    navigationController.pushViewController(DetailBuilder().build(router: self, data: data), animated: true)
  }
}
