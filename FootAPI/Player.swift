//
//  Player.swift
//  FootAPI
//
//  Created by Александр Кисть on 13.04.2023.
//

import UIKit

//struct Player {
//    var id = UUID().uuidString
//    var playerImage: UIImage
//    var playerName: String
//    var playerScore: String
//    var playerAge: String
//
//}

struct Player: Codable {
    var id: String
    var playerImage: String?
    var playerName: String?
    var playerScore: String?
    var playerAge: String?

    init(id: String = UUID().uuidString, data: [String: Any]) {
        self.id = id
        self.playerImage = data["photo"] as? String
        self.playerName = "\(data["firstname"] as? String ?? "") \(data["lastname"] as? String ?? "")"
        self.playerScore = ((data["statistics"] as? [String: Any])?["goals"] as? [String: Any])?["total"] as? String
        self.playerAge = data["age"] as? String
    }
}

