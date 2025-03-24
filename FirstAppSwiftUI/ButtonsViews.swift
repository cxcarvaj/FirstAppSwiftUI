//
//  LoginTest.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 19/3/25.
//

import SwiftUI

struct ButtonsViews: View {
    @Binding var show: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                Button("Click me!") {
                    print("You have clicked me!")
                    show.toggle()
                }
                
                Button("Distroy me", role: .destructive) {
                    print("You have distroyed me!")
                    show.toggle()
                }
                .buttonStyle(.bordered)
                .opacity(show ? 1.0 : 0.0)
                
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
                        Text("Click me now!")
                        Image(systemName: "person.crop.circle.fill")
                    }
                }
                .buttonStyle(.custom)
                .padding()
                
                
                ButtonGirlCoding(labelText: "Custom Text 1") {
                    print("Custom action 1")
                }.padding()
                
                ButtonGirlCoding(labelText: "Custom Text 1.2") {
                    print("Custom action 1.2")
                }.padding()
                
                ButtonGirlCoding(labelText: "Custom Text 2", image: .circles) {
                    print("Custom action 2")
                }.padding()
                
                ButtonGirlCoding(labelText: "Custom Text 2.2", image: .circles) {
                    print("Custom action 2.2")
                }.padding()
                
                Button {
                    
                } label: {
                    JobsCard()
                }.buttonStyle(.plain)
                ShareLink(item: "Hello")

            }
        }
    }
}

#Preview {
    @Previewable @State var show: Bool = true
//    ButtonsViews(show: .constant(Bool.random()))
    ButtonsViews(show: $show)
}
