//
//  PanelsView.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 23/3/25.
//

import SwiftUI

struct PanelsView: View {
    @State private var showSheet = false
    @State private var showAlert = false
    @State private var showConfirmationDialog = false
    @State private var showPopOver = false
    @State private var showInspector = false
    @State private var showCustomAlert = false
    @State private var showFullScreenSheet = false
    @State private var showToast = false
    @State private var composerSelected: Composer?
    @State private var composersSelected = Set<UUID>()
    @State private var detent: PresentationDetent = .medium
    @State private var position = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Position: \(position)")
                Button {
                    showSheet.toggle()
                } label: {
                    Text("Show Sheet")
                }
                
                Button {
                    showFullScreenSheet.toggle()
                } label: {
                    Text("Show FullScreenSheet")
                }
                
                List(selection: $composersSelected) {
                    ForEach(composers) { composer in
                        Text(composer.composer)
                            .tag(composer.id)
                    }
                }
                .listStyle(.plain)
                .frame(height: 200)
                
                Button {
                    showAlert.toggle()
                } label: {
                    Text("Show Alert")
                }
                
                Button {
                    showConfirmationDialog.toggle()
                } label: {
                    Text("Show Confirmation")
                }
                // Se puso a nivel de quien invoca al dialog porque en iPad salia a nivel de stack
                .confirmationDialog("Choose the way to destruct the app", isPresented: $showConfirmationDialog) {
                    
                    Button {} label: {
                        Text("Cordiceps")
                    }
                    
                    Button {} label: {
                        Text("Meteor")
                    }
                    
                    Button(role: .destructive) {} label: {
                        Text("Nuke")
                    }

                } message: {
                    Text("Select the way that we will follow")
                }
                
                // Elementos que solo funcionan en iPad
                Button {
                    showPopOver.toggle()
                } label: {
                    Text("Show POP OVER")
                }
                .popover(isPresented: $showPopOver) {
                    TextsView()
                }
                
                Button {
                    showInspector.toggle()
                } label: {
                    Text("Show Inspector")
                }
                
                Button {
                    showCustomAlert.toggle()
                } label: {
                    Text("Show Custom Alert")
                }
                
                Button {
                    showToast.toggle()
                } label: {
                    Text("Show Toast")
                }
                
                List(selection: $composerSelected) {
                    ForEach(composers) { composer in
                        Text(composer.composer)
                            .tag(composer)
                    }
                }
                .listStyle(.plain)
                .frame(height: 200)
                
                Text("Composer Selected: \(composerSelected?.composer ?? "No composer selected")")
            }
            .buttonStyle(.bordered)
            //$showSheet equivale a _showSheet.projectedValue
            .sheet(isPresented: $showSheet) {
                Text("Hello there!")
                Button {
                    showSheet.toggle()
                } label: {
                    Text("Hide Sheet")
                }
                .buttonStyle(.bordered)
            }
            
            .fullScreenCover(isPresented: $showFullScreenSheet) {
                ButtonsViews(show: $showFullScreenSheet)
            }
            .sheet(item: $composerSelected) { composer in
                ComposerView(composer: composer)
                    .presentationDetents([.medium, .fraction(0.20)], selection: $detent)
                    .presentationBackgroundInteraction(.enabled)
                    .presentationBackground(
                        .linearGradient(colors: [.red, .blue], startPoint: .top, endPoint: .bottom)
                    )
            }
            .alert("Global Error", isPresented: $showAlert) {
                Button {} label: {
                    Text("Pos Dismiss")
                }
                
                Button(role: .destructive) {} label: {
                    Text("Cancel custom button")
                }
                
            } message: {
                Text("An error occurred")
            }
            .inspector(isPresented: $showInspector) {
                TextsView()
                    .inspectorColumnWidth(400)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
            .onChange(of: detent, initial: true) {
                position = detent == .medium ? 1 : 2
            }
            .showCustomAlert(message: "Alerta Custom", show: $showCustomAlert)
            .showToast(isPresented: $showToast, type: .success, message: "Success")
//            .showToast(isPresented: $showToast, type: .error, message: "Error")
//            .showToast(isPresented: $showToast, type: .info, message: "Info")
            
        }
    }
}

#Preview {
    PanelsView()
}
