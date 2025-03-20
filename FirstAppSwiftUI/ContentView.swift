//
//  ContentView.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 17/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!").font(.title)
            Button {
                print("I was pressed")
            } label: {
                Text("Press me")
            }
            .buttonStyle(.borderedProminent)
            
            HStack(alignment: .firstTextBaseline) {
                Image(systemName: "scribble.variable")
                Image(systemName: "square.and.pencil")
                Image(systemName: "list.bullet.clipboard.fill").font(.largeTitle)
            }
            
            Text("Hello, World!")
                .font(.largeTitle)
                .multilineTextAlignment(.trailing)
                .frame(width: 100)
                .background(Color.red)
            
            Text("Hello, World!...")
                .frame(minWidth: 200, alignment: .leading)
                .background(Color.blue)
            
            Text("Hello, World!")
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 100, alignment: .top)
                .background(Color.yellow)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
