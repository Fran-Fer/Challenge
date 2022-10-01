//
//  Networking.swift
//  UalaTest
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import Foundation

// MARK: - Networking Protocol
protocol NetworkingProtocol {
  var session: URLSession { get set }
  func execute<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void)
}

extension NetworkingProtocol {
  func execute<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void ) {
    let urlRequest = endpoint.urlRequest
    
    session.dataTask(with: urlRequest) { data, _, error in
      do {
        if let error = error {
          completion(.failure(error))
          return
        }
        
        guard let data = data else { return }
        
        let parsedRecipeData = try JSONDecoder().decode(T.self, from: data)
        completion(.success(parsedRecipeData))
      } catch {
        completion(.failure(error))
      }
    }.resume()
  }
}

// MARK: - Request Providing protocol
protocol RequestProviding {
  var urlRequest: URLRequest { get }
}
