//
//  LoginTest.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 19/3/25.
//

import SwiftUI

struct ButtonsViews: View {
    var body: some View {
        VStack {
            Button("Click me!") {
                print("You have clicked me!")
            }
            
            Button("Distroy me", role: .destructive) {
                print("You have distroyed me!")
            }
            .buttonStyle(.bordered)
            
            Button("Pulse", systemImage: "person") {
                print("")
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                print("Sent!")
            } label: {
                Image(systemName: "paperplane")
                    .symbolVariant(.fill)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.circle)
            
            Button {
                
            } label: {
                Text("Click me!")
            }
            .buttonStyle(.bordered)
            .tint(.green)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
//            .buttonRepeatBehavior(.enabled)
            
            
            Button {
                
            } label: {
                HStack {
                    Image(.girlCodingWithLaptop)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                    
                    Text("Vamos a estudiar")
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.white)
                }
                .padding()
                .background(.linearGradient(colors: [.blue, .blue.opacity(0.2)], startPoint: .top, endPoint: .bottom))
                .background(in: .rect(cornerRadius: 10))
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
            }
            .padding(.bottom)
            
            
            Button {
                
            } label: {
                HStack {
                    Image(.girlCodingWithLaptop)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                    
                    Text("Vamos a estudiar")
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
}

#Preview {
    ButtonsViews()
}
