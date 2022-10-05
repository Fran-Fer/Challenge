//
//  MainDataManager.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation
import UIKit

// MARK: Main Data Manager Class
final class MainDataManagerClass: MainDataManagerProtocol {
  var network: NetworkingProtocol
  
  // MARK: - Data Manager Initializer
  public init(network: NetworkingProtocol) {
    self.network = network
  }
  
  // MARK: - Data Manager Method
  func fetchRecipeData(isRandom: Bool, completion: @escaping (Result<MealList, Error>) -> Void) {
    let endpoint = isRandom ? Endpoint.random : Endpoint.resume
    network.execute(endpoint.urlRequest, completion: completion)
  }
  
  func fetchImage(url: URL, completion: @escaping (Data?, Error?) -> Void) {
    network.decodeImage(url: url, completion: completion)
  }
}

// MARK: Network class
class Networking: NetworkingProtocol {
  var session: URLSession = URLSession(configuration: .default)
}

// MARK: - Endpoint
enum Endpoint {
  case resume
  case random
}

// MARK: - Endpoint definitions
extension Endpoint: RequestProviding {
  var urlRequest: URLRequest {
    switch self {
    case .resume:
      guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=") else {
        preconditionFailure("URL not found")
      }
      return URLRequest(url: url)
    case .random:
      guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/random.php") else {
        preconditionFailure("URL not found")
      }
      return URLRequest(url: url)
    }
  }
}
