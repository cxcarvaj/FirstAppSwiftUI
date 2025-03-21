//
//  Model.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 20/3/25.
//

import Foundation

struct PokemonRoot: Codable {
    let pokemon: [Pokemon]
}


struct Pokemon: Codable, Identifiable {
    let id = UUID()
    let name: String
    let type: [String]
    let imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case name, type, imageURL
    }
}

extension Pokemon {
    var types: String {
        type.formatted(.list(type: .and))
    }
    
    static let test = Pokemon(name: "Froakie",
                              type: ["Water"],
                              imageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/656.png")!)
}

func getPokemons() -> [Pokemon] {
    guard let url = Bundle.main.url(forResource: "pokemons", withExtension: "json") else {
        return []
    }
    
    do {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(PokemonRoot.self, from: data).pokemon
    } catch {
        print("Error: \(error)")
        return []
    }
}
