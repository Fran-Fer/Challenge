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
  var imageErrorPresented: Bool = false
  
  func presentDishDetail(view: UINavigationController, meal: Meal, imageData: Data) {
    dishDetailPresented = true
  }
  
  func imageError(view: MainViewProtocol) {
    imageErrorPresented = true
  }
  
  func parseError(view: MainViewProtocol) {
    parseErrorPresented = true
  }
  
  func presentMainModule(in window: UIWindow) {
    mainModulePresented = true
  }
}
