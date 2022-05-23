//
//  FavoriteStoriesPlaceholderView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct FavoriteStoriesPlaceholderView: View {
    @Environment(\.colorScheme) var colorScheme
    var color: Color {
        colorScheme == .dark ? Color.veryLightGreen : Color.veryDarkGreen
    }
    var body: some View {
        ZStack {
            color
                .cornerRadius(10)
            Image(colorScheme == .dark ? "favouritesPlaceholderLight" : "favouritesPlaceholderDark")
                .resizable()
                .scaledToFit()
        }
    }
}

struct FavoriteStoriesPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteStoriesPlaceholderView()
    }
}
