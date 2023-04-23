//
//  FavoriteCell.swift
//  FootAPI
//
//  Created by Александр Кисть on 15.04.2023.
//

import UIKit

class FavoriteCell: UITableViewCell {

    var favoritePlayer: Response? {
        didSet{
            configureCell()
        }
    }
    
    func configureCell(){
        guard let favoritePlayer = favoritePlayer else { return }
        circleImageView.loadFrom(URLAddress: favoritePlayer.player.photo)
        nameLabel.text = favoritePlayer.player.name
        ageLabel.text = "Player age \(favoritePlayer.player.age)"
        scoreLabel.text = "Player score \(favoritePlayer.statistics[0].goals.total)"
    }

    static let identifier = "Favorite Cell"
    
    private enum UIConstants{
        static let imageSize: CGFloat = 80
    }
    
    private let circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = UIConstants.imageSize / 2
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "First Label"
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Second Label"
        return label
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Third Label"
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func configure(player: Player){
//        circleImageView.image = player.playerImage
//        nameLabel.text = player.playerName
//        ageLabel.text = "Player age \(player.playerAge)"
//        scoreLabel.text = "Player score \(player.playerScore)"
//    }
    
    private func setupUI(){
        //MARK: - Setup subViews
        contentView.addSubview(circleImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(ageLabel)
        contentView.addSubview(scoreLabel)
        
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
        ])
    }

}


