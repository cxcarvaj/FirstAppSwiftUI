//
//  Toast.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 24/3/25.
//

import SwiftUI

enum ToastType {
    case success
    case error
    case info

    var color: Color {
        switch self {
        case .success: .green
        case .error: .red
        case .info: .blue
        }
    }

    var image: String {
        switch self {
        case .success: "checkmark.circle.fill"
        case .error: "xmark.circle.fill"
        case .info: "info.circle.fill"
        }
    }
}

struct Toast: ViewModifier {
    @Binding var show: Bool
    let type: ToastType
    let message: String
    @State private var timer: Timer?

    func body(content: Content) -> some View {
        content
            .overlay {
                ZStack(alignment: .top) {
                    Color.clear
                        .ignoresSafeArea()
                    HStack {
                        Image(systemName: type.image)
                            .font(.title)
                        Text(message)
                            .font(.headline)
                    }
                    .foregroundStyle(.white)
                    .padding()
                    .background {
                        Capsule().fill(type.color)
                    }
                    .offset(y: show ? 0 : -200)
                }
                .opacity(show ? 1 : 0)
                .onChange(of: show) { _, newValue in
                    if newValue {
                        timer?.invalidate()
                        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                            show = false
                        }
                    } else {
                        timer?.invalidate()
                    }
                }
            }
            .animation(.bouncy(duration: 0.7), value: show)
    }
}

extension View {
    func showToast(isPresented: Binding<Bool>, type: ToastType, message: String) -> some View {
        modifier(Toast(show: isPresented, type: type, message: message))
    }
}
