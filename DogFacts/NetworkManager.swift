//
//  NetworkManager.swift
//  DogFacts
//
//  Created by benjamin.chrysostom on 03/11/22.
//

import Foundation

let api = "https://dog-facts-api.herokuapp.com/api/v1/resources/dogs?number="
class NetworkManager {
    
    private init() {
        
    }
    
    static var shared = NetworkManager()
    
    func getDogFacts(number: Int, completed: @escaping (([Fact]) -> ())) {
        let actualApi = api + "\(number)"
        guard let url = URL(string: actualApi) else { return }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data_ = data else { return }
            do {
                let model_ = try JSONDecoder().decode([Fact].self, from: data_)
                completed(model_)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
