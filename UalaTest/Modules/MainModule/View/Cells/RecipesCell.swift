//
//  RecipesCell.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation
import UIKit

// MARK: Recipe Custom Cell
class RecipesCell: UITableViewCell {
  let recipeImage: UIImageView = UIImageView()
  let recipeLabel: UILabel = UILabel()
  
  // MARK: - Cell life Cycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(recipeLabel)
    addSubview(recipeImage)
    activateConstraints()
    setUpCell()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Cell Private Funcs
  private func activateConstraints() {
    recipeImage.translatesAutoresizingMaskIntoConstraints = false
    recipeImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    recipeImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
    recipeImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
    recipeImage.widthAnchor.constraint(equalTo: recipeImage.heightAnchor, multiplier: 16/9).isActive = true
    
    recipeLabel.translatesAutoresizingMaskIntoConstraints = false
    recipeLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    recipeLabel.leadingAnchor.constraint(equalTo: recipeImage.trailingAnchor, constant: 20).isActive = true
    recipeLabel.heightAnchor.constraint(equalToConstant: 88).isActive = true
    recipeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
  }
  
  private func setUpCell() {
    // TODO: initialize labels and images with model content
    recipeLabel.numberOfLines = 0
    recipeLabel.adjustsFontSizeToFitWidth = true
    recipeLabel.text = ""
    
    recipeImage.layer.cornerRadius = 10
    recipeImage.clipsToBounds = true
    recipeImage.image = UIImage(systemName: "")
  }
}
