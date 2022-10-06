//
//  MockMainPresenter.swift
//  UalaTestTests
//
//  Created by Francisco Ferrante on 05/10/2022.
//

import Foundation
import UIKit
@testable import UalaTest

class MockMainPresenter: MainPresenterProtocol {
  var interactor: MainInteractorProtocol?
  var router: MainRouterProtocol?
  var view: MainViewProtocol?
  
  var calledFetchParsedData: Bool = false
  var calledDidFetchRecipeData: Bool = false
  var calledFailedToFetchData: Bool = false
  var sentToDishDetail: Bool = false
  var fetchedThumbImage: Bool = false
  var calledDidFetchThumbmImage: Bool = false
  var returnedThumbImage: Bool = false
  var didFetchRandomImage: Bool = false
  var didFetchRandom: Bool = false
  var didFailImage: Bool = false
  
  func fetchParsedData() {
    interactor?.getData()
    calledFetchParsedData = true
  }
  
  func didFetchRecipeData(with result: MealList) {
    view?.updateView(withData: result)
    calledDidFetchRecipeData = true
  }
  
  func failedToFetchData() {
    router?.parseError(view: view!)
    calledFailedToFetchData = true
  }
  
  func sendToDishDetail(with meal: Meal, imageData: Data, view: UINavigationController) {
    sentToDishDetail = true
  }
  
  func fetchThumbImage(url: URL) {
    interactor?.getThumbImage(url: url, isRandom: true)
    fetchedThumbImage = true
  }
  
  func didFetchThumbImage(url: URL, data: Data, isRandom: Bool) {
    calledDidFetchThumbmImage = true
  }
  
  func returnThumbImage(url: URL) -> Data? {
    returnedThumbImage = true
    return Data()
  }
  
  func didFetchRandomImage(url: URL) {
    view?.updateBanner(data: Data())
    didFetchRandomImage = true
  }
  
  func fetchRandom() {
    interactor?.getRandomRecipe()
    didFetchRandom = true
  }
  
  func failedImage() {
    router?.imageError(view: view!)
    didFailImage = true
  }
  
  
}
