//
//  NetworkManager.swift
//  MVVM presentation - TableView
//
//  Created by Mateusz Zacharski on 22/11/2020.
//

import Foundation

class NetworkManager {
    static let shared: NetworkManager = NetworkManager()
    
    enum HTTPError: Error {
        case invalidURL
        case invalidResponse(Data?, URLResponse?)
    }
    
    public func get(urlString: String, completionBlock: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completionBlock(.failure(HTTPError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            if let _ = error {
                completionBlock(.failure(error!))
                return
            }
            
            guard let responseData = data, let httpResponse = response as? HTTPURLResponse, 200 == httpResponse.statusCode else {
                completionBlock(.failure(HTTPError.invalidResponse(data, response)))
                return
            }
            
            completionBlock(.success(responseData))
        }
        
        task.resume()
    }
}
