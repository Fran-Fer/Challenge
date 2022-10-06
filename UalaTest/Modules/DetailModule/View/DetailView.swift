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
    view.addSubview(recipeDetailTable)
    
    recipeDetailTable.delegate = self
    recipeDetailTable.dataSource = self
    recipeDetailTable.register(DescriptionCell.self, forCellReuseIdentifier: "DescriptionCell")
    recipeDetailTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

    recipeDetailTable.translatesAutoresizingMaskIntoConstraints = false
    recipeDetailTable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    recipeDetailTable.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    recipeDetailTable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    recipeDetailTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 230).isActive = true
    recipeDetailTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    recipeDetailTable.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
    recipeDetailTable.rowHeight = UITableView.automaticDimension
  }
  
  private func returnIngridients(recipe: Meal) -> [String?] {
    let ingridients: [String?] = [recipe.strIngredient1, recipe.strIngredient2, recipe.strIngredient3, recipe.strIngredient4, recipe.strIngredient5, recipe.strIngredient6, recipe.strIngredient7, recipe.strIngredient8, recipe.strIngredient9, recipe.strIngredient10, recipe.strIngredient11, recipe.strIngredient12, recipe.strIngredient13, recipe.strIngredient14, recipe.strIngredient15, recipe.strIngredient16, recipe.strIngredient17, recipe.strIngredient18, recipe.strIngredient19, recipe.strIngredient20]
    return ingridients
  }
  
  private func returnMeassures(recipe: Meal) -> [String?] {
    let meassures: [String?] = [recipe.strMeasure1, recipe.strMeasure2, recipe.strMeasure3, recipe.strMeasure4, recipe.strMeasure5, recipe.strMeasure6, recipe.strMeasure7, recipe.strMeasure8, recipe.strMeasure9, recipe.strMeasure10, recipe.strMeasure11, recipe.strMeasure12, recipe.strMeasure13, recipe.strMeasure14, recipe.strMeasure15, recipe.strMeasure16, recipe.strMeasure17, recipe.strMeasure18, recipe.strMeasure19, recipe.strMeasure2]
    return meassures
  }
  
  private func returnCellCount(ingridients: [String?]) -> Int {
    var cellCount: Int = 0
    for i in 0...19 {
      if ingridients[i] != "" {
        cellCount += 1
      }
    }
    return cellCount
  }
}

// MARK: - Detail Protocol Methods
extension DetailViewController: DetailViewProtocol {
  func updateRecipe(with recipe: Meal) {
    DispatchQueue.main.async {
      self.recipe = recipe
      self.navigationItem.title = recipe.strMeal ?? ""
      self.recipeDetailTable.reloadData()
    }
  }
  
  func updateImage(with image: Data) {
    DispatchQueue.main.async {
      self.recipeImage = image
      self.recipeImageView.image = UIImage(data: image)
      self.recipeDetailTable.reloadData()
    }
  }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let cellData: Meal = recipe else { return 0 }
    return returnCellCount(ingridients: returnIngridients(recipe: cellData))
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cellData: Meal = recipe else { return UITableViewCell() }
    
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for:  indexPath) as! DescriptionCell
      cell.recipe = cellData
      cell.selectionStyle = .none
      cell.setUpDescriptionCell()
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:  indexPath)
      cell.selectionStyle = .none
      guard let meassure = returnMeassures(recipe: cellData)[indexPath.row],
            let ingridient = returnIngridients(recipe: cellData)[indexPath.row]
      else { return cell }
      cell.textLabel?.text = ingridient + " (" + meassure + ")"
      return cell
    }
  }
}
