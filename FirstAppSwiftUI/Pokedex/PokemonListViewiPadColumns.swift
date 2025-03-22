//
//  PokemonListViewiPad.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 21/3/25.
//

import SwiftUI

struct PokemonListViewiPadColumns: View {
    let pokemons = getPokemons()
    // Si quiero trabajar con columnas debo tratar el NavigationView como un VStack
    // Con esto tendría 3 columnas: `List`, 'if let` y `Text`
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
            
//            if let pokemon = pokemons.first {
//                PokemonDetailView(pokemon: pokemon)
//            }
//            
//            Text("Random text")
            
            ContentUnavailableView("No Pokemon selected", image: "pokeball", description: Text("There's no Pokemon selected. Select one from the list."))
        }
    }
}

#Preview {
    PokemonListViewiPadColumns()
}
