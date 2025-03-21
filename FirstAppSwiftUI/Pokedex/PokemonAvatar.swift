//
//  PokemonAvatar.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 21/3/25.
//

import SwiftUI

struct PokemonAvatar: View {
    let imageUrl: URL

    var body: some View {
        AsyncImage(url: imageUrl) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .background {
                    Color.gray.opacity(0.2)
                }
                .clipShape(Circle())
            
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    PokemonAvatar(imageUrl: Pokemon.test.imageURL)
}
