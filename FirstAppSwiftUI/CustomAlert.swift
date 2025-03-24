//
//  CustomAlert.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 24/3/25.
//

import SwiftUI

fileprivate struct CustomAlert: ViewModifier {
    let message: String
    @Binding var showCustomAlert: Bool
    
    func body(content: Content) -> some View {
        content
            .disabled(showCustomAlert)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .overlay {
                Rectangle()
                    .fill(.black)
                    .ignoresSafeArea()
                    .opacity(showCustomAlert ? 0.5 : 0.0)
            }
            .overlay {
                VStack {
                    Text(message)
                        .font(.headline)
                    Button {
                        showCustomAlert.toggle()
                    } label: {
                        Text("Ok")
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.green)
                        .shadow(color: .primary.opacity(0.5), radius: 10, x: 0, y: 10)
                }
                .opacity(showCustomAlert ? 1.0 : 0.0)
                .offset(y: showCustomAlert ? 0.0 : 200)
            }
            .animation(.bouncy, value: showCustomAlert)
    }
}

extension View {
    func showCustomAlert(message: String, show: Binding<Bool>) -> some View {
        modifier(CustomAlert(message: message, showCustomAlert: show))
    }
}
