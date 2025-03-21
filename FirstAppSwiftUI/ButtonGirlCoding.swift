//
//  ButtonGirlCoding.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 20/3/25.
//

import SwiftUI

struct ButtonGirlCoding: View {
    
    let labelText: String
    var image: ImageResource = .girlCodingWithLaptop
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                
                Text(labelText)
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.white)
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.linearGradient(colors: [.blue, .blue.opacity(0.2)], startPoint: .top, endPoint: .bottom))
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
            }
        }
    }
}


#Preview {
    ButtonGirlCoding(labelText: "Custom Text") {
        print("Custom action")
    }
}
