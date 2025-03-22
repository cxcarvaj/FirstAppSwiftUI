//
//  PokemonListViewiPad.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 21/3/25.
//

import SwiftUI

struct PokemonListViewiPad: View {
    let pokemons = getPokemons()
    
    var body: some View {
        NavigationView {
            List(pokemons) { pokemon in
                NavigationLink {
                    PokemonDetailView(pokemon: pokemon)
                } label: {
                    PokemonCell(pokemon: pokemon)
                }

            }
            .navigationTitle("Pokedex")
            .commonToolbar
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    PokemonListViewiPad()
}
