//
//  PokemonListView.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 21/3/25.
//

import SwiftUI

struct PokemonListView: View {
    let pokemons = getPokemons()
    
    var body: some View {
        NavigationStack {
            List(pokemons) { pokemon in
                PokemonCell(pokemon: pokemon)
            }
        }
        .navigationTitle("Pokedex")
    }
}

#Preview {
    PokemonListView()
}


