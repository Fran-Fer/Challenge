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
  var dispatchGroup: DispatchGroup = DispatchGroup()
  
  var gotThumbImage: Bool = true
  var gotRandomRecipe: Bool = true
  var gotData: Bool = true
  
  func getThumbImage(url: URL, isRandom: Bool) {
    gotThumbImage = true
  }
  
  func getRandomRecipe() {
    gotRandomRecipe = true
  }
  
  func getData() {
    gotData = true
  }
}
