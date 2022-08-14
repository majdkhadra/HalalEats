//
//  NetworkManager.swift
//  HalalEats
//
//  Created by Majd Khadra on 8/14/22.
//

import Foundation

class NetworkManager {
    func request < T: Codable > (endpoint: Endpoint, completion: @escaping(Result < T, Error > ) -> ()) {
        let urlRequestBuilder = URLRequstBuilder(endpoint: endpoint)
        let urlRequest = urlRequestBuilder.buildURLRequest()
        
        guard let urlRequest = urlRequest else {
            return
        }
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil
            else {
                completion(.failure(error!))
                print("network error")
                return
            }
            
            guard response != nil, let data = data else {
                return
            }
            
            DispatchQueue.main.async {
                if let responseObject = try? JSONDecoder().decode(T.self, from: data) {
                    completion(.success(responseObject))
                } else {
                    print("there was an error")
                }
            }
            
        }
        dataTask.resume()
    }
}
