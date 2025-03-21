//
//  PokemonCell.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 21/3/25.
//

import SwiftUI

struct PokemonCell: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(pokemon.name)
                    .font(.headline)
                Text(pokemon.types)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            PokemonAvatar(imageUrl: pokemon.imageURL)
            
        }
    }
}

#Preview {
    PokemonCell(pokemon: .test)
}
