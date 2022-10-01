//
//  MockRouter.swift
//  UalaTestTests
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation
import UIKit
@testable import UalaTest

// MARK: Mock main router
class MockMainRouter: MainRouterProtocol {
  var mainModulePresented: Bool = false
  var dishDetailPresented: Bool = false
  var parseErrorPresented: Bool = false
  
  func presentDishDetail(view: UINavigationController, data: RecipiesList) {
    dishDetailPresented = true
  }
  
  func parseError(view: MainViewProtocol) {
    parseErrorPresented = true
  }
  
  func presentMainModule(in window: UIWindow) {
    mainModulePresented = true
  }
}
