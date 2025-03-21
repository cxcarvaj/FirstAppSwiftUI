//
//  JobsCard.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 20/3/25.
//

import SwiftUI
//Aquí el Rectangle y Text son relativos al VStack
struct JobsCard: View {
    var body: some View {
        // Los tamaños en UIKit y SwiftUI no son relativos, sino que son fijos o flexibles
        VStack {
            ZStack(alignment: .bottomTrailing) {
                // El tamaño de ZStack tiene el tamaño del elemento más grande en ancho y alto
                Image(.jobs)
                    .resizable()
                    .scaledToFit()
                Rectangle()
                    .fill(.white.opacity(0.5))
                    .frame(height: 50)
                Text("Steve Jobs")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.trailing)
                    .padding(.bottom, 5)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
            .padding()
            
        }
    }
}

#Preview {
    JobsCard()
}
