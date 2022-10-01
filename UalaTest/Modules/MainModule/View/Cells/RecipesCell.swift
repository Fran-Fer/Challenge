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
  @IBOutlet weak var recipeImage: UIImageView!
  @IBOutlet weak var recipeLabel: UILabel!
  
  // MARK: - Cell life Cycle
  override func awakeFromNib() {
    super.awakeFromNib()
    setUpCell()
  }
  
  func setUpCell() {
    // TODO: initialize labels and images with model content
  }
}
