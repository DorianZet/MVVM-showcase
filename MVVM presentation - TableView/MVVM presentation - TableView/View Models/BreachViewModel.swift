//
//  BreachViewModel.swift
//  MVVM presentation - TableView
//
//  Created by Mateusz Zacharski on 22/11/2020.
//

import Foundation

fileprivate var baseUrl: String = "https://haveibeenpwned.com/api/v2"
fileprivate var breachesExtensionURL: String = "/breaches"

class BreachViewModel { // Our view model requests for the breaches in a form of BreachModel array.
    var breaches = [BreachModel]()
    
}

extension BreachViewModel {
    func fetchBreaches(completion: @escaping (Result<[BreachModel], Error>) -> Void) {
        NetworkManager.shared.get(urlString: baseUrl + breachesExtensionURL) { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .failure(let error):
                print("failure", error)
                
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    self.breaches = try decoder.decode([BreachModel].self, from: data)
                    completion(.success(try decoder.decode([BreachModel].self, from: data)))
                } catch {
                    // deal with the errors from JSON decoding
                    print("Failed to decode JSON data")
                }
            }
            
        }
    }
}
