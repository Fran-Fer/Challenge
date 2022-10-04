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
    apiDataManager?.fetchRecipeData() { [weak self] data in
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
}
