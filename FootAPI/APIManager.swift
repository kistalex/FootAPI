//
//  APIManager.swift
//  FootAPI
//
//  Created by Александр Кисть on 17.04.2023.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    private let baseUrl = "https://api-football-v1.p.rapidapi.com"
    private let headers = [
        "x-rapidapi-key": "20f27ec4admsha34bcfce85e2020p1d593ejsn7800feddab33",
        "x-rapidapi-host": "api-football-v1.p.rapidapi.com"
    ]
    
    func getTopScorers(completion: @escaping (Result<PlayerData, Error>) -> Void) {
        let url = "https://api-football-v1.p.rapidapi.com/v3/players/topscorers?league=39&season=2020"
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Data could not be retrieved"])
                completion(.failure(error))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let playerData = try decoder.decode(PlayerData.self, from: data)
                completion(.success(playerData))
            } catch let error {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
