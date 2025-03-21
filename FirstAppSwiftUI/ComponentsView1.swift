//
//  ComponentsView1.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 20/3/25.
//

import SwiftUI


enum OptionsMenu: String, CaseIterable, Identifiable {
    var id: Self { self }
    
    case file = "File"
    case edit = "Edit"
    case view = "View"
    case window = "Window"
    case product = "Product"
    case help = "Help"
}

struct FileOptions: Identifiable {
    let id = UUID()
    var name: String
    var children: [FileOptions]?
}

struct ComponentsView1: View {
    let fileOptions: [FileOptions] = [
        .init(name: "New"),
        .init(name: "File", children: [.init(name: "Open"),
                                       .init(name: "Save"),
                                       .init(name: "Save As"),
                                       .init(name: "Close")
        ]),
        .init(name: "Edit", children: [.init(name: "Cut"),
                                       .init(name: "Copy"),
                                       .init(name: "Paste", children: [
                                        .init(name: "Paste with Format"),
                                        .init(name: "Paste without Format"),
                                       ]),
        ]),
    ]
        
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    LabeledContent("Model Name", value: "iPhone 16e")
                    LabeledContent("Date", value: Date.now, format: .dateTime)
                    LabeledContent("Random Thing") {
                        Image(systemName: "person.circle")
                    }
                } header: {
                    Text("Section header")
                }
                
                Section {
                    DisclosureGroup {
                        Text("Group 1.1")
                        
                        DisclosureGroup {
                            Text("Group 1.2.1")
                            Text("Group 1.2.2")
                            Text("Group 1.2.3")
                        } label: {
                            Text("Group 1.2")
                        }
                        .tint(.green)
                                                
                        Text("Group 1.3")

                        
                    } label: {
                        Text("Group 1")
                    }
                    
                    OutlineGroup(fileOptions, children: \.children) { options in
                        Text(options.name)
                    }

                } header: {
                    Text("Information")
                }
                
                Section {
                    Image(.jobs)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .contextMenu {
                            ForEach(OptionsMenu.allCases) { option in
                                Button {
                                    
                                } label: {
                                    Text(option.rawValue)
                                }

                            }
                        }

                } header: {
                    Text("Image")
                }
            }
            .navigationTitle("Form")
            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
            .toolbarBackground(.linearGradient(colors: [.brown], startPoint: .leading, endPoint: .trailing), for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Text("Random Button")
                    }

                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        ForEach(OptionsMenu.allCases) { option in
                            Button {
                                
                            } label: {
                                Text(option.rawValue)
                            }

                        }
                        
                    } label: {
                        Image(systemName: "square.and.arrow.down")
                    }

                }
            }
        }
    }
}

#Preview {
    ComponentsView1()
}
