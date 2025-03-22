//
//  PokemonListView.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 21/3/25.
//

import SwiftUI

struct PokemonListStackView: View {
    let pokemons = getPokemons()
    
    var body: some View {
        NavigationStack {
            List(pokemons) { pokemon in
                NavigationLink(value: pokemon) {
                    PokemonCell(pokemon: pokemon)
                }
//                .listRowInsets(EdgeInsets(top: 40, leading: 10, bottom: 30, trailing: 50))
//                .listRowSeparator(.hidden)
                .listRowSeparatorTint(.indigo)
                .listRowBackground(Color.black.opacity(0.1))

            }
//            .listRowSpacing(70)
            .navigationTitle("Pokedex")
            .navigationDestination(for: Pokemon.self) { pokemon in
                PokemonDetailViewData(pokemon: pokemon)
            }
            .navigationDestination(for: String.self) { string in
                Text(string)
            }
            .commonToolbar
            .listStyle(.inset)
            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
            .toolbarBackground(Color.brown.opacity(0.1), for: .navigationBar)
        }
    }
}

#Preview {
    PokemonListStackView()
}


