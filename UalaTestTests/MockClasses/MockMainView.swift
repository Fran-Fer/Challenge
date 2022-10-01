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
  
}

extension MockMainView: MainViewProtocol {
  func updateView(withData: Recipe) {
  }
  
  func displayError() {
  }
}
