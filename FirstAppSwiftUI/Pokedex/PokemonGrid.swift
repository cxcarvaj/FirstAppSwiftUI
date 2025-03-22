//
//  PokemonGrid.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 22/3/25.
//

import SwiftUI

struct PokemonGrid: View {
    let pokemons = getPokemons()
    
    let fixedItems: [GridItem] = [GridItem(.fixed(125)), GridItem(.fixed(125)), GridItem(.fixed(125))]
    let flexibleItems: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    let adaptativeItems: [GridItem] = [GridItem(.adaptive(minimum: 75))]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptativeItems) {
                    ForEach(pokemons) { pokemon in
                        NavigationLink(value: pokemon) {
                            PokemonAvatar(pokemon: pokemon, style: .grid)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .safeAreaPadding()
            .navigationTitle("Pokedex")
            .navigationDestination(for: Pokemon.self) { pokemon in
                PokemonDetailViewData(pokemon: pokemon)
            }
        }
    }
}

#Preview {
    PokemonGrid()
}
