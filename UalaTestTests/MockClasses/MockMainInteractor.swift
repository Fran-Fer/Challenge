//
//  MockMainInteractor.swift
//  UalaTestTests
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation
@testable import UalaTest

class MockMainInteractor: MainInteractorProtocol {
  var presenter: MainPresenterProtocol?
  var apiDataManager: MainDataManagerProtocol?
  func getData() {
  }
}
