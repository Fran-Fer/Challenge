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
  
  func fetchRecipe() -> RecipiesList {
    guard let recipe: RecipiesList = self.interactor?.RecipeData else { return RecipiesList() }
    return recipe
  }
}
