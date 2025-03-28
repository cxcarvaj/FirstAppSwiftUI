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
        //NavigationView está deprecado, pero NavigationStack solo sirve para iOS16+
        //En iOS 15 solo se pueden hacer navegaciones con maquinas de estado o de la siguiente forma:
        NavigationView {
            List(pokemons) { pokemon in
                // NavigationLink title,value - NavigationLink value,label solo funcionan en Navigation Stacks
                // NavigationLink destination es compatible para ambos
                NavigationLink {
                    PokemonDetailView(pokemon: pokemon)
                } label: {
                    PokemonCell(pokemon: pokemon)
                }

            }
            .navigationTitle("Pokedex")
            .commonToolbar
        }
    }
}

#Preview {
    PokemonListView()
}


