//
//  FavoritePlayersViewController.swift
//  FootAPI
//
//  Created by Александр Кисть on 13.04.2023.
//

import UIKit

class FavoritePlayersViewController: UIViewController {
    weak var delegate: PlayerCellDelegate?

    var favoritePlayers: [Response] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.tableView.dataSource = self
        title = "Favorite players"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
 
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.identifier)
        return tableView
    }()
    
    private func setupUI(){
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension FavoritePlayersViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritePlayers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.identifier, for: indexPath) as? FavoriteCell else {
            fatalError("TableView couldn't dequeue a PlayerCell")
        }
        let player = favoritePlayers[indexPath.row]
        cell.favoritePlayer = player
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

