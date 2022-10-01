//
//  DetailView.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation
import UIKit

// MARK: Detail View class
class DetailViewController: UIViewController {
  var presenter: DetailPresenterProtocol?
}

extension DetailViewController: DetailViewProtocol {
  func updateUI() {}
}
