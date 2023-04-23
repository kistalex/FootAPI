//
//  APIManager.swift
//  FootAPI
//
//  Created by Александр Кисть on 17.04.2023.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    private let headers = [
        "x-rapidapi-key": "20f27ec4admsha34bcfce85e2020p1d593ejsn7800feddab33",
        "x-rapidapi-host": "api-football-v1.p.rapidapi.com"
    ]
    
    func getTopScorers(completion: @escaping ([Player]?, Error?) -> Void) {
        let urlString = "https://api-football-v1.p.rapidapi.com/v3/players/topscorers?league=39&season=2023"
        
        let request = NSMutableURLRequest(url: NSURL(string: urlString)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                    return
                }
                if let data = json["response"] as? [[String: Any]] {
                    let players = data.compactMap { Player(data: $0) }
                    completion(players, nil)
                } else {
                    completion(nil, nil)
                }
            } catch let error {
                completion(nil, error)
            }
        })
        
        task.resume()
    }
    
}
