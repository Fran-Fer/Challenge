//
//  DescriptionCell.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 05/10/2022.
//

import Foundation
import UIKit

// MARK: Recipe Description Custom Cell
class DescriptionCell: UITableViewCell {
  let descriptionTitleView: UIView = UIView()
  let textView: UIView = UIView()
  let titleLabel: UILabel = UILabel()
  let descriptionLabel: UILabel = UILabel()
  
  var recipe: Meal?
  var recipeImage: Data?
  
  // MARK: - Description Cell life Cycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(descriptionTitleView)
    addSubview(textView)
    descriptionTitleView.addSubview(titleLabel)
    textView.addSubview(descriptionLabel)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Description Cell Private Methods
  private func setUpView() {
    
  }
}
