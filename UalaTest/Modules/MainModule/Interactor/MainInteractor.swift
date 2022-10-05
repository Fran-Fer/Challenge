//
//  MainInteractor.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation

// MARK: Main Interactor
class MainInteractor: MainInteractorProtocol {
  // MARK: - Main Interactor Variables
  weak var presenter: MainPresenterProtocol?
  var apiDataManager: MainDataManagerProtocol?
  
  // MARK: - Main Interactor Methods
  func getData() {
    apiDataManager?.fetchRecipeData(isRandom: false) { [weak self] data in
      guard let self = self else { return }
      
      switch data {
      case .success(let result):
        self.presenter?.didFetchRecipeData(with: result)
      case .failure:
        self.presenter?.failedToFetchData()
        break
      }
    }
  }
  
  func getThumbImage(url: URL) {
    apiDataManager?.fetchImage(url: url, completion: { data, error in
      if let data = data {
        self.presenter?.didFetchThumbImage(url: url, data: data)
      } else {
        self.presenter?.failedToFetchData()
      }
    })
  }

  func getRandomRecipe() {
    apiDataManager?.fetchRecipeData(isRandom: true){ [weak self] data in
      guard let self = self else { return }
      
      switch data {
      case .success(let result):
        guard let resultUrl: URL = result.meals?[0].strMealThumb else { return }
        self.getThumbImage(url: resultUrl)
        self.presenter?.didFetchRandomImage(url: resultUrl)
      case .failure:
        self.presenter?.failedToFetchData()
        break
      }
    }
  }
}
