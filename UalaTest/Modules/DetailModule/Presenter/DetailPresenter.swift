//
//  DetailPresenter.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation

// MARK: Detail Presenter
class DetailPresenter: DetailPresenterProtocol {
  // MARK: - Detail Presenter Properties
  var interactor: DetailInteractorProtocol?
  var router: DetailRouterProtocol?
  weak var view: DetailViewProtocol?
  
  func fetchRecipe() {
    guard let recipe: Meal = self.interactor?.recipeData else { return }
    view?.updateRecipe(with: recipe)
  }
  
  func fetchImageData() {
    guard let recipeImage: Data = self.interactor?.recipeImage else { return }
    view?.updateImage(with: recipeImage)
  }
}
