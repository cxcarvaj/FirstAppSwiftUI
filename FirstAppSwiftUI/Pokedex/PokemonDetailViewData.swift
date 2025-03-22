//
//  PokemonDetailView.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 21/3/25.
//

import SwiftUI

struct PokemonDetailViewData: View {
    let pokemons = getPokemons().shuffled().prefix(3)
    let pokemon: Pokemon
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Pokemon name")
                    .font(.headline)
                
                Text(pokemon.name)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .background(.green.opacity(0.2))
                    .background(in: .rect(cornerRadius: 10))
                
                PokemonAvatar(pokemon: pokemon, style: .featured)
                
                TopThreePokemons(topThreePokemons: pokemons)
                
                NavigationLink(value: "Hola") {
                    Text("Hola")
                }
                
            }
            .navigationTitle(pokemon.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationView {
        PokemonDetailViewData(pokemon: .test)
    }
}


