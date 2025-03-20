//
//  TextsView.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 18/3/25.
//

import SwiftUI

struct TextsView: View {
    let tile = ImagePaint(image: Image(.patron))
    
    let attributedString: AttributedString = {
        var attributed = AttributedString(stringLiteral: "Welcome to Apple. Please read our privacy policy")
        
        attributed.foregroundColor = .gray
        attributed.font = .clBody
        
        if let appleTextIndex = attributed.range(of: "Apple") {
            attributed[appleTextIndex].foregroundColor = .red
            attributed[appleTextIndex].font = .headline
        }
        
        if let privacyTextIndex = attributed.range(of: "privacy policy") {
            attributed[privacyTextIndex].foregroundColor = .blue
            attributed[privacyTextIndex].link = URL(string: "https://apple.com")
            attributed[privacyTextIndex].underlineStyle = .single
        }
        
        
        return attributed
        
    }()
    
    var body: some View {
        VStack {
            Text("Hello Swift")
                .font(.title)
                .bold()
                .italic()
                .underline(pattern: .dash, color: .blue)
                .foregroundStyle(.cyan)
            
            Text("Hello Swift")
                .fontDesign(.rounded)
            
            Text("Hello Swift")
                .font(.largeTitle)
                .foregroundStyle(.myCustomText)
                .fontWeight(.light)
                .fontWidth(.compressed)
            
            Text("Hello Swift")
                .fontDesign(.monospaced)
        }
        .foregroundStyle(.green)
        
        HStack {
            Text("Hello There!")
                .foregroundStyle(.linearGradient(
                    colors: [.red, .blue, .red],
                    startPoint: .leading,
                    endPoint: .trailing))
            
            Text("Hello There!")
                .foregroundStyle(tile)
        }
        .font(.title)
        .fontWeight(.black)
        .fontWidth(.expanded)
        
        Image(systemName: "pencil")
            .font(.largeTitle)
            .symbolVariant(.fill.circle)
            .symbolRenderingMode(.palette)
            .foregroundStyle(.mint, .indigo)
        
        Label("Send", systemImage: "paperplane")
            .foregroundStyle(.brown)
        
        Label {
            Text("Send")
                .foregroundStyle(.blue)
        } icon: {
            Image(systemName: "paperplane")
                .foregroundStyle(.brown)
        }
        
        Text("Send \(Image(systemName: "paperplane.circle.fill"))")
        
        Image(.circles)
            .resizable()
            .renderingMode(.template)
            .scaledToFit()
            .frame(width: 50)
            .foregroundStyle(tile)
        
        
        Text("What are you doing?")
            .font(.system(.title, design: .rounded, weight: .semibold))
        
        Text("What are you doing?")
            .font(.system(size: 24)) //Prohibido usar font sizes
        
        Text("Nothing!")
            .font(.custom("Mukta Mahee", size: 24))
        
        Text("Nothing!")
            .font(.custom("Mukta Mahee", size: 24, relativeTo: .title)) //La mejor práctica
        
        Text("Games of Swift")
            .font(.custom("Game of Squids", size: 24, relativeTo: .title))
        
        Text("Season 2").font(.clBody)
        
        Text("One ring to rule them all, one ring to find them. One ring to bring them, and in the darkness bind them")
            .lineSpacing(5)
//            .kerning(3)
            .tracking(1)
            .textCase(.uppercase)
            .multilineTextAlignment(.trailing)
            .lineLimit(2)
            .textSelection(.enabled)
            .minimumScaleFactor(0.8)
            .truncationMode(.head)
        
        
        Text("Space the final frontier, send out into the vastness of space. To **explore** new worlds, **discover** new life forms, and **seek** out ***new civilizations***. Look for the ~~missing~~ link. [Star Trek](https://startrek.com)")
        
        Text(attributedString)
    }
}

#Preview {
    TextsView()
}
