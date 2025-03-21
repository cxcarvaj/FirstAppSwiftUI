//
//  CustomButton.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 20/3/25.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .fontWeight(.black)
            .fontWidth(.expanded)
            .foregroundStyle(.linearGradient(colors: [.brown, .orange, .gray], startPoint: .leading, endPoint: .trailing))
            .padding()
            .overlay {
                //Puedo poner n overlays y backgrounds que quiera.
                RoundedRectangle(cornerRadius: 10) //Sin el stroke, se pone modo fill
                    .stroke(lineWidth: 4)
            }
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.mint)
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
            }
//            .opacity(configuration.isPressed ? 0.3 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
    }
}

// Esta extension solo aparecera cuando la instancia sea un CustomButtonStyle
extension ButtonStyle where Self == CustomButtonStyle {
    static var custom: CustomButtonStyle {
        CustomButtonStyle()
    }
}
