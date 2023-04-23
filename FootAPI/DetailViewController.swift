//
//  DetailViewController.swift
//  FootAPI
//
//  Created by Александр Кисть on 13.04.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
     var topScorer: Response? {
        didSet{
            configureUI()
        }
    }
    
    func configureUI(){
        guard let topScorer = topScorer else { return }
        imageView.loadFrom(URLAddress: topScorer.player.photo)
        nameLabel.text = "Name: \(topScorer.player.name)"
        ageLabel.text = "Age: \(topScorer.player.age)"
        scoreLabel.text = "Score: \(topScorer.statistics[0].goals.total)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    
    
    
    
    private func setupUI(){
        
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(ageLabel)
        view.addSubview(scoreLabel)
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: view.frame.height / 3),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            ageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            scoreLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 20),
            scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
