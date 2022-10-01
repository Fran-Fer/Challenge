//
//  MainViewController.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation
import UIKit

// MARK: Main View Controller
class MainViewController: UIViewController {
  var presenter: MainPresenterProtocol?
}

extension MainViewController: MainViewProtocol {
  func updateView(withData: Recipe) {
  }
  func displayError() {
  }
}
