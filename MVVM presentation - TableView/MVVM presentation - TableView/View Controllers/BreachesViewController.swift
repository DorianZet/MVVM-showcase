//
//  BreachesViewController.swift
//  MVVM presentation - TableView
//
//  Created by Mateusz Zacharski on 22/11/2020.
//

import UIKit

class BreachesViewController: UIViewController { // Note that we don't have a BreachView now, as the only view we need is the table view which we implement directly in BreachesViewController.

    var tableView = UITableView()
    
    var data = [BreachModel]()
    
    var breachesViewModel = BreachViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        breachesViewModel.fetchBreaches { [weak self] (breaches) in 
            DispatchQueue.main.async {
                self?.updateUI()
            }
        }
    }
    
    func updateUI() {
        tableView.reloadData()
    }
}

extension BreachesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breachesViewModel.breaches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cellData = breachesViewModel.breaches[indexPath.row]
        cell.textLabel?.text = cellData.title
        cell.detailTextLabel?.text = "Breached \(cellData.pwnCount) times"
        return cell
    }
}

extension BreachesViewController: UITableViewDelegate {
    //
}
