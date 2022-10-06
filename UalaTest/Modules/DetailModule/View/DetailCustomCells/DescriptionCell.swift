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
  
  // MARK: - Description Cell life Cycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(descriptionTitleView)
    addSubview(textView)
    descriptionTitleView.addSubview(titleLabel)
    textView.addSubview(descriptionLabel)
    
    acivateConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Description Cell Private Methods
  private func acivateConstraints() {
    descriptionTitleView.translatesAutoresizingMaskIntoConstraints = false
    descriptionTitleView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    descriptionTitleView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    descriptionTitleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    descriptionTitleView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.centerXAnchor.constraint(equalTo: descriptionTitleView.centerXAnchor).isActive = true
    titleLabel.centerYAnchor.constraint(equalTo: descriptionTitleView.centerYAnchor).isActive = true
    titleLabel.textColor = .white
    
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    textView.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
    textView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
    textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 2).isActive = true
    
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.topAnchor.constraint(equalTo: textView.topAnchor).isActive = true
    descriptionLabel.bottomAnchor.constraint(equalTo: textView.bottomAnchor).isActive = true
    descriptionLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor).isActive = true
    descriptionLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor).isActive = true
  }
  
  // MARK: - Set up cell info
  func setUpDescriptionCell() {
    descriptionTitleView.backgroundColor = .systemBlue
    textView.backgroundColor = .white
    
    titleLabel.text = "Instructions"
    
    descriptionLabel.adjustsFontSizeToFitWidth = true
    descriptionLabel.numberOfLines = 0
    descriptionLabel.textColor = .black
    descriptionLabel.text = recipe?.strInstructions ?? ""
    
  }
}
