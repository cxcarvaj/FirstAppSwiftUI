//
//  ComposerView.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 23/3/25.
//

import SwiftUI

struct Composer: Identifiable, Hashable {
    let id = UUID()
    let composer: String
}

let composers: [Composer] = [
    Composer(composer: "Jhon Williams"),
    Composer(composer: "James Horner"),
    Composer(composer: "Jerry Goldsmith"),
    Composer(composer: "Hans Zimmer"),
]


extension Composer {
    static let test = Composer(composer: "Jhon Williams")
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


struct ComposerView: View {
    let composer: Composer
    
    var body: some View {
        Text(composer.composer)
            .font(.largeTitle)
    }
}

#Preview {
    ComposerView(composer: .test)
}
