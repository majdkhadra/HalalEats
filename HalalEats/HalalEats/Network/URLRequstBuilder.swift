//
//  URLRequstBuilder.swift
//  HalalEats
//
//  Created by Majd Khadra on 8/14/22.
//

import Foundation

class URLRequstBuilder {
    
    var endpoint: Endpoint
    
    init(endpoint: Endpoint) {
        self.endpoint = endpoint
    }
    
    func buildURL() -> URL? {
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURL
        components.path = endpoint.path
        components.queryItems = endpoint.parameters
        print(components.url)
        guard let url = components.url else {
            return nil
        }
        
        return url
    }
    
    func buildURLRequest() -> URLRequest? {
        let apiKey = "poaVIRCjKOJxN6iT8n2o6nELHzUv3ebzWcZHQcs0tgqhIMbxJf_p3w-lt3ZOVeub_FKussmAZKgJ2JS6kRpv7df1Xog5f88gX13tEnueWDOESpEtGTbbD3iZy7T4YnYx"

        let url = buildURL()
        
        guard let url = url else {
            print("URL is nil")
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        urlRequest.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        return urlRequest
    }
}
