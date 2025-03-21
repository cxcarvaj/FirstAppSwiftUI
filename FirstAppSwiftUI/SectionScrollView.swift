//
//  SectionScrollView.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 20/3/25.
//

import SwiftUI

struct SectionScrollView: View {
    var body: some View {
        ScrollView {
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                Section {
                    ForEach(1..<10) { _ in
                        JobsCard()
                    }
                } header: {
                    header(text: "Steve Jobs")
                }
                
                Section {
                    ForEach(1..<10) { _ in
                        TimCookCard()
                    }
                } header: {
                    header(text: "Tim Cook")
                }
            }
        }
    }
    
    func header(text: String) -> some View {
        Text(text)
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .background {
                Rectangle()
                    .fill(.ultraThinMaterial)
            }
    }
}

#Preview {
    SectionScrollView()
}
