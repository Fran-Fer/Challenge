//
//  MainEntity.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation

// MARK: - Recipe
struct Recipe: Codable {
  var recipiesList: [RecipiesList]?
}

struct RecipiesList: Codable {
  var name: String?
  var description: String?
  var image: String?
  var ingridients: Ingridients?
}

struct Ingridients: Codable {
  var ingridientList: [String]?
}
