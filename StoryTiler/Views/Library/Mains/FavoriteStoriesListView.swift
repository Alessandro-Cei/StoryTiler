//
//  FavoriteStoriesListView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct FavoriteStoriesListView: View {
    var favoriteStories: [Story]
    var width: CGFloat
    var covers: [UIImage?]
    var deleteStory: ((Story) -> Void)?
    var toggleFavorite: ((Story) -> Void)?
    var applyNameChange: ((Story, String) -> Void)?
    var applyAnswer: ((Story, Tile, Question, String) -> Void)?
    var saveImage: ((Story, UIImage) -> Void)?
    var body: some View {
        LibraryTitleView(title: "Favorites Stories")
        if !favoriteStories.isEmpty {
            LibraryRowView(stories: favoriteStories, width: width, covers: covers, deleteStory: deleteStory, toggleFavorite: toggleFavorite, applyAnswer: applyAnswer, saveImage: saveImage)
        } else {
            FavoriteStoriesPlaceholderView()
        }
    }
}

struct FavoriteStoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteStoriesListView(favoriteStories: [], width: 100, covers: [])
    }
}
