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

    recipeDetailTable.translatesAutoresizingMaskIntoConstraints = false
    recipeDetailTable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    recipeDetailTable.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    recipeDetailTable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    recipeDetailTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 230).isActive = true
    recipeDetailTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    recipeDetailTable.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
    recipeDetailTable.rowHeight = UITableView.automaticDimension
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
    return 1
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
      let cell = tableView.dequeueReusableCell(withIdentifier: "IngridientsCell", for:  indexPath) as! IngridientsCell
      return cell
    }
  }
}
