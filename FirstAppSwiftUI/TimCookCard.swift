//
//  TimCookCard.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 20/3/25.
//

import SwiftUI

struct TimCookCard: View {
    var body: some View {
        //Aquí el Rectangle y Text son relativos a la imagen
        Image(.timcook)
            .resizable()
            .scaledToFit()
            .overlay(alignment: .bottom) {
                Rectangle()
                    .fill(.white.opacity(0.5))
                    .frame(height: 50)
                    .overlay(alignment: .trailing) {
                        Text("Tim Cook")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.trailing)
                            .padding(.bottom, 5)
                    }
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .contextMenu {
                ForEach(OptionsMenu.allCases) { option in
                    Button {
                        
                    } label: {
                        Text(option.rawValue)
                    }

                }
            }
            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
            .padding()
    }
}

#Preview {
    TimCookCard()
}
