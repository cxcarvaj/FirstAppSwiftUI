//
//  ToolbarModifier.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 22/3/25.
//

import SwiftUI

fileprivate struct ToolbarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }

                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        
                    } label: {
                        Text("Order")
                    }

                }
            }
    }
}


extension View {
    var commonToolbar: some View {
        modifier(ToolbarModifier())
    }
}
