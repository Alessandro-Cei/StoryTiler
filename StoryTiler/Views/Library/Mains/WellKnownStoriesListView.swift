//
//  WellKnownStoriesListView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct WellKnownStoriesListView: View {
    @Binding var stories: [Story]
    var wellKnownStories: [Story]
    var story: Story
    var width: CGFloat
    var randomizeTile: ((Story) -> Void)?
    var resetStory: ((Story) -> Void)?
    var body: some View {
        LibraryTitleView(title: "Well-Known Stories")
        WellKnownStoryRowView(stories: $stories, wellKnownStories: wellKnownStories, story: story, width: width, randomizeTile: randomizeTile, resetStory: resetStory)
    }
}

struct WellKnownStoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        WellKnownStoriesListView(stories: .constant([]), wellKnownStories: [], story: Story.byDefault, width: 100)
    }
}
