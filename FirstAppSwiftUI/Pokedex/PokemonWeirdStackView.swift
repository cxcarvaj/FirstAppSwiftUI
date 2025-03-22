//
//  PokemonListView.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 21/3/25.
//

import SwiftUI

struct PokemonWeirdStackView: View {
    let pokemons = getPokemons()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(pokemons) { pokemon in
                        NavigationLink(value: pokemon) {
                            HStack {
                                PokemonCell(pokemon: pokemon)
                                Image(systemName: "arrow.right.circle")
                            }
                            .contentShape(Rectangle())
//                            .background {
//                                Color(UIColor.systemBackground)
//                            }
                        }
//                        .foregroundStyle(.primary)
                        .buttonStyle(.plain)
                    }
                }
            }
            .safeAreaPadding()
            .navigationTitle("Pokedex")
            .navigationDestination(for: Pokemon.self) { pokemon in
                PokemonDetailViewData(pokemon: pokemon)
            }
            .navigationDestination(for: String.self) { string in
                Text(string)
            }
            .commonToolbar
        }
    }
}

#Preview {
    PokemonWeirdStackView()
}


