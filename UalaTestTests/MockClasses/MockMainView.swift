//
//  MockMainView.swift
//  UalaTestTests
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation
@testable import UalaTest
import UIKit

class MockMainView: UIViewController {
  var presenter: MainPresenterProtocol?
  var updatedBanner: Bool = false
  var reloadedTableView: Bool = false
  var failToFetchImage: Bool = false
  var updatedView: Bool = false
  var displayedError: Bool = false
}

extension MockMainView: MainViewProtocol {

  func updateBanner(data: Data) {
    updatedBanner = true
  }
  
  func reloadTableView() {
    reloadedTableView = true
  }
  
  func failedToFetchImage() {
    failToFetchImage = true
  }
  
  func updateView(withData: MealList) {
    updatedView = true
  }
  
  func displayError() {
    displayedError = true
  }
}
