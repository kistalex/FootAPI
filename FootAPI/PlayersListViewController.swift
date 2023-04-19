//
//  PlayersListViewController.swift
//  FootAPI
//
//  Created by Александр Кисть on 13.04.2023.
//

import UIKit

class PlayersListViewController: UIViewController {
    
    private var players: [Player] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        APIManager.shared.getTopScorers { [weak self] (players, error) in
                    if let error = error {
                        print(error)
                    } else if let players = players {
                        self?.players = players
                        self?.tableView.reloadData()
                    }
                }
        title = "Top Scorers"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
 
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PlayerCell.self, forCellReuseIdentifier: PlayerCell.identifier)
        return tableView
    }()
    
    private var aboutButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "About"
        button.tintColor = .blue
        return button
    }()
    
    private func setupUI(){
        navigationItem.rightBarButtonItem = aboutButton
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

extension PlayersListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayerCell.identifier, for: indexPath) as? PlayerCell else {
            fatalError("TableView couldn't dequeue a PlayerCell")
        }
        
        let player = players[indexPath.row]
        cell.player = player
        cell.configure(player: player)
        
        return cell
    }
}

extension PlayersListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let player = players[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.player = player
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

