//
//  UserStoriesListView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct UserStoriesListView: View {
    var userStories: [Story]
    var width: CGFloat
    var covers: [UIImage?]
    var deleteStory: ((Story) -> Void)?
    var toggleFavorite: ((Story) -> Void)?
    var applyNameChange: ((Story, String) -> Void)?
    var applyAnswer: ((Story, Tile, Question, String) -> Void)?
    var saveImage: ((Story, UIImage) -> Void)?
    var body: some View {
        LibraryTitleView(title: "My Stories")
        if !userStories.isEmpty {
            LibraryRowView(stories: userStories, width: width, covers: covers, deleteStory: deleteStory, toggleFavorite: toggleFavorite, applyNameChange: applyNameChange, applyAnswer: applyAnswer, saveImage: saveImage)
        } else {
            UserStoriesPlaceholderView()
        }
    }
}

struct UserStoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        UserStoriesListView(userStories: [], width: 100, covers: [])
    }
}
