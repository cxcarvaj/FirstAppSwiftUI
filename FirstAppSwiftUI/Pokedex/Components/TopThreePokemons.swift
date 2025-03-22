//
//  TopThreePokemons.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 22/3/25.
//

import SwiftUI

struct TopThreePokemons: View {
    var topThreePokemons: ArraySlice<Pokemon>
    
    var body: some View {
        VStack {
            Text("Other Pokemons")
                .font(.footnote)
            
            HStack {
                ForEach(topThreePokemons) { pokemon in
                    NavigationLink(value: pokemon) {
                        PokemonAvatar(pokemon: pokemon)
                    }
                }
            }
        }
        .padding()
        .background(.green.opacity(0.2))
        .background(in: .capsule)
    }
}

#Preview {
    TopThreePokemons(topThreePokemons: getPokemons().shuffled().prefix(3))
}
