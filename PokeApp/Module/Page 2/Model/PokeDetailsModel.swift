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
    //    let experience: Int
    var moves: [MoveElement]
    let sprites: Sprites
    let stats: [Stat]
    //    let details: MoveDetailsModel
    
    enum CodingKeys: String, CodingKey {
        case id, name, moves, sprites, stats
        //        case experience = "base_experience"
    }
    
}

struct MoveElement: Codable {
    var move: MovesModel
    
    enum CodingKeys: String, CodingKey {
        case move
    }
}


struct MovesModel: Codable {
    let name: String
    let url: String
    var detail: MoveDetailsModel?
}

struct StatClass: Codable {
    let name: String
    let url: String
    //    var detail: MoveDetailsModel
    
    
}

//struct Sprites: Codable {
//    let frontDefault: String
//
//    enum CodingKeys: String, CodingKey {
//        case frontDefault = "front_default"
//    }
//}

struct Sprites: Codable {
    let other: Other
    
    enum codingKeys: String, CodingKey {
        case other
    }
}

struct Other: Codable {
    let home: Home
    
    enum CodingKeys: String, CodingKey {
        case home = "home"
    }
}

struct Home: Codable {
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

// moves details with effects
struct MoveDetailsModel: Codable {
    let accuracy: Int?
    let power: Int?
    let pp: Int
    let effectEntries: [EffectEntry]
    
    
    enum CodingKeys: String, CodingKey {
        case accuracy, power, pp
        case effectEntries = "effect_entries"
        
    }
    var effectString: String? {
        let firstEntry = effectEntries[0]
        let shortEffect = firstEntry.shortEffect != nil ? firstEntry.shortEffect : nil
        let effect = firstEntry.effect != nil ? firstEntry.effect : shortEffect
        return effect
    }
}



struct EffectEntry: Codable {
    let effect: String
    let shortEffect: String
    
    enum CodingKeys: String, CodingKey {
        case effect
        case shortEffect = "short_effect"
    }
    
}
