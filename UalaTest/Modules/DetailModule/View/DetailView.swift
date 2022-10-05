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
  var recipeImage: Data?
  var recipeDetailTable: UITableView = UITableView()
  var recipeImageView: UIImageView = UIImageView()

  // MARK: - Detail Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.fetchRecipe()
    presenter?.fetchImageData()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setUpDetailView()
    setUpDetailBanner()
    setUpTableView()
  }
  
  // MARK: - Private methods
  private func setUpDetailView() {
    view.backgroundColor = .white
    
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.view.backgroundColor = .systemBlue
    navigationController?.view.tintColor = .white
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    navigationController?.navigationBar.barTintColor = .systemBlue
    navigationController?.navigationBar.isTranslucent = false
    navigationController?.navigationBar.barStyle = .black
  }
  
  private func setUpDetailBanner() {
    view.addSubview(recipeImageView)
    
    recipeImageView.translatesAutoresizingMaskIntoConstraints = false
    recipeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    recipeImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
    recipeImageView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
    recipeImageView.heightAnchor.constraint(equalToConstant: view.frame.height/4).isActive = true
    recipeImageView.backgroundColor = .systemBlue.withAlphaComponent(0.2)
    recipeImageView.contentMode = .scaleAspectFit
  }
  
  private func setUpTableView() {
    
  }
  
  private func activateConstraints() {
  }
}

// MARK: - Detail Protocol Methods
extension DetailViewController: DetailViewProtocol {
  func updateRecipe(with recipe: Meal) {
    DispatchQueue.main.async {
      self.recipe = recipe
      self.navigationItem.title = recipe.strMeal ?? ""
    }
  }
  
  func updateImage(with image: Data) {
    DispatchQueue.main.async {
      self.recipeImage = image
      self.recipeImageView.image = UIImage(data: image)
    }
  }
}
