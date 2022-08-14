//
//  HEData.swift
//  HalalEats
//
//  Created by Majd Khadra on 8/14/22.
//

import Foundation

struct Data: Codable {
    var total: Int
    var businesses: [Business]
}

struct Business: Codable {
    var alias: String
}
