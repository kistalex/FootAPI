//
//  PlayersListViewController.swift
//  FootAPI
//
//  Created by Александр Кисть on 13.04.2023.
//

import UIKit

protocol PlayerCellDelegate: AnyObject {
    func didTapFavoriteButton(for cell: PlayerCell)
}

class PlayersListViewController: UIViewController {
    
    private var players: [Response] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        APIManager.shared.getTopScorers { result in
            switch result {
            case .success(let playerData):
                self.players = playerData.response
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
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
        cell.delegate = self
        let player = players[indexPath.row]
        cell.topScorer = player
        return cell
    }
}

extension PlayersListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let player = players[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.topScorer = player
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
//MARK: - Save to favorite players Delegate
extension PlayersListViewController: PlayerCellDelegate{
    func didTapFavoriteButton(for cell: PlayerCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let favoriteVC = FavoritePlayersViewController()
        favoriteVC.delegate = self
        let player = players[indexPath.row]
        if  cell.isFavorite{
            favoriteVC.favoritePlayers.append(player)
        } else {
            favoriteVC.favoritePlayers.removeAll(where: { $0 == player})
        }
        navigationController?.pushViewController(favoriteVC, animated: true)
    }
}
