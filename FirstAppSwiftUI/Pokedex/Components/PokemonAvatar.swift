//
//  PokemonAvatar.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 21/3/25.
//

import SwiftUI

enum AvatarStyle {
    case cell, featured, grid
}

struct PokemonAvatar: View {
    let pokemon: Pokemon
    var isBig = false
    var style: AvatarStyle = .cell
    
    var body: some View {
        switch style {
        case .cell:
            cellBody
        case .featured:
            featuredBody
        case .grid:
            gridBody
        }
    }

    var cellBody: some View {
        AsyncImage(url: pokemon.imageURL) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
        } placeholder: {
            ProgressView()
        }
        .background {
            Color.gray.opacity(0.2)
        }
        .clipShape(Circle())
    }
    
    var featuredBody: some View {
        AsyncImage(url: pokemon.imageURL) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 100)
        } placeholder: {
            ProgressView()
        }
        .background {
            Color.gray.opacity(0.4)
        }
        .clipShape(Circle())
    }
    
    var gridBody: some View {
        VStack(spacing: 0) {
            AsyncImage(url: pokemon.imageURL) { image in
                image
                    .resizable()
                    .scaledToFill()
//                    .frame(width: 100, height: 60)
            } placeholder: {
                ProgressView()
            }
            Text(pokemon.name)
                .font(.footnote)
                .bold()
        }
        .padding(.vertical, 5)
        .background {
            Color.gray.opacity(0.4)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .primary.opacity(0.5), radius: 10, x: 0, y: 10)
    }
}

#Preview {
    PokemonAvatar(pokemon: Pokemon.test, style: .grid)
}
