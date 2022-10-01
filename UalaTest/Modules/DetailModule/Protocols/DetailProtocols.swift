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
  func updateUI()
}

// MARK: Detail Interactor Protocol
protocol DetailInteractorProtocol: AnyObject {}

// MARK: Detail Presenter Protocol
protocol DetailPresenterProtocol: AnyObject {}

// MARK: Detail Router Protocol
protocol DetailRouterProtocol: AnyObject {}

// MARK: Detail Builder Protocol
protocol DetailBuilderProtocol: AnyObject {
  
}
