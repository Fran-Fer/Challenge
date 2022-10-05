//
//  DetailView.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation
import UIKit

// MARK: Detail View class
class DetailViewController: UIViewController {
  var presenter: DetailPresenterProtocol?
  var recipe: Meal?
  let recipeImage: UIImageView = UIImageView()
  let recipeName: UILabel = UILabel()
  let recipeIngridients: UILabel = UILabel()
  let recipeDescription: UILabel = UILabel()

  // MARK: - Detail Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Private methods
  private func setUpDetailView() {
    view.backgroundColor = .white
  }
  
  private func activateConstraints() {
  }
  
  private func setUpLabels() {
  }
}

extension DetailViewController: DetailViewProtocol {
  func updateRecipe(with recipe: Meal) {
    
  }
  
  func updateImage(with image: Data) {
    
  }
}
