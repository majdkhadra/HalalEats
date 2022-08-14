//
//  Endpoint.swift
//  HalalEats
//
//  Created by Majd Khadra on 8/13/22.
//

import Foundation

protocol Endpoint {
    /// HTTP or HTTPS
    var scheme: String {
        get
    }
    
    var baseURL: String {
        get
    }

    var path: String {
        get
    }

    var parameters: [URLQueryItem] {
        get
    }

    var method: String {
        get
    }
}

enum HEEndpoint: Endpoint {
    case getSearchResults(searchText: String)
var scheme: String {
        switch self {
            default: return "https"
        }
    }
var baseURL: String {
        switch self {
            default: return "api.yelp.com"
        }
    }
var path: String {
        switch self {
            case.getSearchResults:
                return "/v3/businesses/search"
        }
    }
var parameters: [URLQueryItem] {
switch self {
            case.getSearchResults(let searchText):
                return [URLQueryItem(name: "location", value: searchText),
                URLQueryItem(name: "categories", value: "halal")]
        }
}
var method: String {
        switch self {
            case.getSearchResults:
                return "GET"
        }
    }
}
