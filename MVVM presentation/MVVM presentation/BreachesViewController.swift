//
//  BreachesViewController.swift
//  MVVM presentation
//
//  Created by Mateusz Zacharski on 22/11/2020.
//

import UIKit

class BreachesViewController: UIViewController {
    var breachesViewModel = BreachViewModel(model: [BreachModel(title: "Hello World!")]) // we create a view model by passing a model to it.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let breachView = BreachView(frame: self.view.frame) // we initialize the breach view.
        breachesViewModel.configure(breachView) // we configure the breach view with a view model, which has a model provided beforehand.
        self.view.addSubview(breachView) // we add the breach view to our main view.
        
        NSLayoutConstraint.activate([ // we set the auto layout for the breach view.
            breachView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            breachView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            breachView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            breachView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
    }
    


}
