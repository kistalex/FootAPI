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

struct PlayerData: Codable, Equatable {
    let response: [Response]
    
    static func == (lhs: PlayerData, rhs: PlayerData) -> Bool {
        return lhs.response == rhs.response
    }
}

// MARK: - Response
struct Response: Codable, Equatable {
    let player: Player
    let statistics: [Statistic]
    
    static func == (lhs: Response, rhs: Response) -> Bool {
        return lhs.player == rhs.player && lhs.statistics == rhs.statistics
    }
}

// MARK: - Player
struct Player: Codable, Equatable {
    let id: Int
    let name, firstname, lastname: String
    let age: Int
    let birth: Birth
    let nationality, height, weight: String
    let injured: Bool
    let photo: String
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.firstname == rhs.firstname &&
            lhs.lastname == rhs.lastname &&
            lhs.age == rhs.age &&
            lhs.birth == rhs.birth &&
            lhs.nationality == rhs.nationality &&
            lhs.height == rhs.height &&
            lhs.weight == rhs.weight &&
            lhs.injured == rhs.injured &&
            lhs.photo == rhs.photo
    }
}

// MARK: - Birth
struct Birth: Codable, Equatable {
    let date, place, country: String
    
    static func == (lhs: Birth, rhs: Birth) -> Bool {
        return lhs.date == rhs.date && lhs.place == rhs.place && lhs.country == rhs.country
    }
}

// MARK: - Statistic
struct Statistic: Codable, Equatable {
    let goals: Goals
    
    static func == (lhs: Statistic, rhs: Statistic) -> Bool {
        return lhs.goals == rhs.goals
    }
}

// MARK: - Goals
struct Goals: Codable, Equatable {
    let total: Int
    
    static func == (lhs: Goals, rhs: Goals) -> Bool {
        return lhs.total == rhs.total
    }
}

