//
//  PokeDetailsModel.swift
//  PokeApp
//
//  Created by Farhan Permana on 19/03/23.
//

import Foundation

struct PokemonDetailsModel: Codable{
    let id: Int
    let name: String
    let experience: Int
    let moves: [MoveElement]
    let sprites: Sprites
    let stats: [Stat]
    
    enum CodingKeys: String, CodingKey {
        case id, name, moves, sprites, stats
        case experience = "base_experience"
    }
    
}

struct MoveElement: Codable {
    let move: StatClass
}

struct StatClass: Codable {
    let name: String
    let url: String
}

struct Sprites: Codable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct Stat: Codable {
    let baseStat: Int
    let stat: StatClass
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat
    }
}
