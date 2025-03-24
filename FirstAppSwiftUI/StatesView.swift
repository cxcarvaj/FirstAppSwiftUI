//
//  StatesView.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 23/3/25.
//

import SwiftUI

struct StatesView: View {
    // Normalmente, todos los States deberían ser privados por buena práctica.
    // Por qué? Porque si son privados, el inicializador del Struct no nos los va a pedir
    @State private var message = "Hello, World!"
    // Cuando creo un State, se están creando 3 variables. En este caso `message`, `_message` y $message
    // Donde _message tiene acceso al wrappedValue
    @State private var show = false
    var body: some View {
        VStack {
            if show {
                Text(message)
                    .font(.largeTitle)
                    .transition(
                        .move(edge: .leading)
                        .combined(with: .opacity)
                    )
            }
            Image(.sombraOscura)
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .opacity(show ? 1.0 : 0.0)
                .offset(y: show ? 0.0 : -100)
                .rotationEffect(show ? .zero : .degrees(360))
            
            HStack {
                Button {
                    message = "Goodbye, World!"
                } label: {
                    Text("Say Goodbye 👋🏽")
                }
                
                Button {
                    show.toggle()
                } label: {
                    Text("Show/Hide Text")
                }
            }
            .buttonStyle(.bordered)
        }
//        .frame(height: 100, alignment: .bottom)
        .animation(.bouncy(duration: 2.0), value: show)

    }
}

#Preview {
    StatesView()
}
