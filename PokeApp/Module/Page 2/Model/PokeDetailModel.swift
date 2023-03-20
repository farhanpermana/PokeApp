//
//  PokeDetailModel.swift
//  PokeApp
//
//  Created by Farhan on 16/03/23.
//

import Foundation

// MARK: -- Unused Model --

struct PokeDetailModel: Codable {
    var id: Int
    var names: String
    var sprites: SpritesModel
    var moves: [MovesModel]
    var stats: [StatsModel]
    
    
}

struct MovesModel: Codable {
    var move: MoveModel
}

struct MoveModel: Codable {
    
}

struct StatsModel: Codable {
    
}

struct SpritesModel: Codable {
    var imageUrlString: String?
    
    enum CodingKeys: String, CodingKey {
        case imageUrlString = "front_default"
    }
}

//struct MoveDetail {
//    var accuracy: Int
//    var power: Int
//    var pp: Int
//
//}
