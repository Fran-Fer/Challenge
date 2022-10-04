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
    recipe = presenter?.fetchRecipe()
  }
  
  // MARK: - Private methods
  private func setUpDetailView() {
    view.backgroundColor = .white
    view.addSubview(recipeImage)
    view.addSubview(recipeName)
  }
  
  private func activateConstraints() {
    recipeImage.translatesAutoresizingMaskIntoConstraints = false
    recipeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    recipeImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250).isActive = true
    recipeImage.widthAnchor.constraint(equalToConstant: view.frame.width/2.5).isActive = true
    recipeImage.heightAnchor.constraint(equalToConstant: view.frame.height/6).isActive = true
    recipeImage.tintColor = .white.withAlphaComponent(0.8)
    
    recipeName.translatesAutoresizingMaskIntoConstraints = false
    recipeName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    recipeName.topAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: 10).isActive = true
    
    recipeDescription.translatesAutoresizingMaskIntoConstraints = false
    recipeDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    recipeDescription.topAnchor.constraint(equalTo: recipeName.bottomAnchor, constant: 5).isActive = true
    
    recipeIngridients.translatesAutoresizingMaskIntoConstraints = false
    recipeIngridients.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    recipeIngridients.topAnchor.constraint(equalTo: recipeDescription.bottomAnchor, constant: 5).isActive = true
  }
  
  private func setUpLabels() {
  }
}

extension DetailViewController: DetailViewProtocol {
  func updateUI() {}
}
