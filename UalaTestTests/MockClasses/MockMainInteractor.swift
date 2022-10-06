//
//  MockMainInteractor.swift
//  UalaTestTests
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation
@testable import UalaTest

class InteractorCalls {
  var gotThumbImage: Bool = true
  var gotRandomRecipe: Bool = true
  var gotData: Bool = true
}

class MockMainInteractor: MainInteractorProtocol {
  var presenter: MainPresenterProtocol?
  var apiDataManager: MainDataManagerProtocol?
  var dispatchGroup: DispatchGroup = DispatchGroup()
  var interactorCalls: InteractorCalls = InteractorCalls()
  
  func getThumbImage(url: URL, isRandom: Bool) {
    interactorCalls.gotThumbImage = true
  }
  
  func getRandomRecipe() {
    interactorCalls.gotRandomRecipe = true
  }
  
  func getData() {
    interactorCalls.gotData = true
  }
}
