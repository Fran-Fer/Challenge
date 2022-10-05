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
  func execute<T: Decodable>(_ urlRequest: URLRequest, completion: @escaping (Result<T, Error>) -> Void)
  func decodeImage(url: URL, completion: @escaping (Data?, Error?) -> (Void))
}

extension NetworkingProtocol {
  func execute<T: Decodable>(_ urlRequest: URLRequest, completion: @escaping (Result<T, Error>) -> Void ) {
    
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
  
  func decodeImage(url: URL, completion: @escaping (Data?, Error?) -> (Void)) {
    
    session.downloadTask(with: url) { response, localUrl, error in
      do {
        if let error = error {
          completion(nil, error)
          return
        }
        
        guard let localUrl = localUrl?.url else {
          completion(nil, error)
          return
        }

        let data = try Data(contentsOf: localUrl)
        completion(data, nil)
      } catch {
        completion(nil, error)
      }
    }.resume()
  }
}

// MARK: - Request Providing protocol
protocol RequestProviding {
  var urlRequest: URLRequest { get }
}
