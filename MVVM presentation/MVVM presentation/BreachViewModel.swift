//
//  BreachViewModel.swift
//  MVVM presentation
//
//  Created by Mateusz Zacharski on 22/11/2020.
//

import Foundation

class BreachViewModel {

    init(model: [BreachModel]? = nil) {
        if let inputModel = model {
            breaches = inputModel
        }
    }
    
    var breaches = [BreachModel]()
    
    public func configure(_ view: BreachView) {
        view.titleLabel.text = breaches.first?.title
    }
    
}

extension BreachViewModel {
    func fetchBreaches(completion: @escaping (Result<[BreachModel], Error>) -> Void) {
        completion(.success(breaches))
    }
}
