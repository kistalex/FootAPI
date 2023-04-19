//
//  PlayerCell.swift
//  FootAPI
//
//  Created by Александр Кисть on 13.04.2023.
//

import UIKit

class PlayerCell: UITableViewCell {
    
    var player: Player?
    
    static let identifier = "Player Cell"
    
    private enum UIConstants{
        static let imageSize: CGFloat = 80
    }
    
    let circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = UIConstants.imageSize / 2
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "First Label"
        return label
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Second Label"
        return label
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Third Label"
        return label
    }()
    
    private lazy var  starButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(starButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var isFavorite: Bool = false
    
    @objc func starButtonTapped() {
    
            if isFavorite {
//                if let index = favoritePlayers.firstIndex (where: { $0.id == playerData.id }) {
//                    favoritePlayers.remove (at: index)
//                    if let favoritePlayersData = try? JSONEncoder().encode(favoritePlayers){
//                        defaults.set(favoritePlayers, forKey: "favoritePlayers")
//                    }
//                }
                starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
                starButton.tintColor = .red
            } else {
                //if is  in favorite this button have red  color
                starButton.setImage(UIImage(systemName: "star"), for: .normal)
                starButton.tintColor = .black
//                favoritePlayers.append(player)
//                defaults.set(favoritePlayers, forKey: "favoritePlayers")
            }
            isFavorite.toggle()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(player: Player){
        circleImageView.image = UIImage(systemName: "person.fill")
        nameLabel.text = player.playerName
        ageLabel.text = "Player age \(String(describing: player.playerAge))"
        scoreLabel.text = "Player score \(String(describing: player.playerScore))"
    }
    
    private func setupUI(){
        //MARK: - Setup subViews
        contentView.addSubview(circleImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(ageLabel)
        contentView.addSubview(scoreLabel)
        contentView.addSubview(starButton)
        
        //MARK: - Setup constraints
        NSLayoutConstraint.activate([
            circleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            circleImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circleImageView.widthAnchor.constraint(equalToConstant: UIConstants.imageSize),
            circleImageView.heightAnchor.constraint(equalToConstant: UIConstants.imageSize),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            ageLabel.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 16),
            ageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            scoreLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 8),
            scoreLabel.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 16),
            scoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            scoreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            starButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            starButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            starButton.widthAnchor.constraint(equalToConstant: 30),
            starButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
