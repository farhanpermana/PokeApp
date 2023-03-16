//
//  PokeModel.swift
//  PokeApp
//
//  Created by Farhan on 15/03/23.
//

import Foundation

struct PokeModel: Codable {
    var count: Int
    var results: [ResultModel]
}

struct ResultModel: Codable {
    var name: String
    var url: String
    
    enum CodingKeys: CodingKey {
        case name
        case url
    }
}
