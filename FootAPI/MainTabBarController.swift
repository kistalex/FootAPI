//
//  MainTabBarController.swift
//  FootAPI
//
//  Created by Александр Кисть on 13.04.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        generateTabBar()
        
    }
    
    private func generateTabBar(){
        viewControllers = [
            UINavigationController(rootViewController: generateVC(viewController: PlayersListViewController(), title: "Top Scores", image: UIImage(systemName: "figure.soccer"))),
            UINavigationController(rootViewController: generateVC(viewController: FavoritePlayersViewController(), title: "Favorite", image: UIImage(systemName: "star.fill"))),
        ]
    }
    
    private func setupUI(){
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController{
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    
}
