//
//  UserStoriesPlaceholderView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct UserStoriesPlaceholderView: View {
    @Environment(\.colorScheme) var colorScheme
    var color: Color {
        colorScheme == .dark ? Color.veryLightBlue : Color.veryDarkBlue
    }
    var body: some View {
        ZStack {
            color
                .cornerRadius(10)
                
            VStack {
                Text("Looks like you need some help...")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Image(colorScheme == .dark ? "storiesPlaceholderLight" : "storiesPlaceholderDark")
                    .resizable()
                    .scaledToFit()
            }
            .padding(10)
        }
    }
}

struct UserStoriesPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        UserStoriesPlaceholderView()
    }
}
