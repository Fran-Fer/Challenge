//
//  MainPresenter.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation
import UIKit

// MARK: Main Presenter
class MainPresenter: MainPresenterProtocol {
  // MARK: - Main Presenter Properties
  var interactor: MainInteractorProtocol?
  var router: MainRouterProtocol?
  weak var view: MainViewProtocol?
  private var imageDictionary: [URL : Data] = [:]
  
  // MARK: - Main Presenter Methods
  func fetchParsedData() {
    interactor?.getData()
  }
  
  func fetchThumbImage(url: URL) {
    if imageDictionary[url] == nil {
      interactor?.getThumbImage(url: url, isRandom: false)
    }
  }
  
  func fetchRandom() {
    interactor?.getRandomRecipe()
  }

  func didFetchThumbImage(url: URL, data: Data, isRandom: Bool) {
    if isRandom {
      interactor?.dispatchGroup.leave()
    }
    imageDictionary[url] = data
    view?.reloadTableView()
  }
  
  func returnThumbImage(url: URL) -> Data? {
    return imageDictionary[url]
  }
  
  func didFetchRecipeData(with result: MealList) {
    view?.updateView(withData: result)
  }
  
  func didFetchRandomImage(url: URL) {
    guard let bannerImageData: Data = imageDictionary[url] else { return }
    view?.updateBanner(data: bannerImageData)
  }
  
  func failedToFetchData() {
    if let view = view {
      router?.parseError(view: view)
    } else {
      preconditionFailure("View could not be assigned")
    }
  }
  
  func sendToDishDetail(with meal: Meal, imageData: Data, view: UINavigationController) {
    router?.presentDishDetail(view: view, meal: meal, imageData: imageData)
  }
}
