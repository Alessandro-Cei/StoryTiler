//
//  WellKnownStoryRowView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 24/11/21.
//

import SwiftUI

struct WellKnownStoryRowView: View {
    @Binding var stories: [Story]
    var wellKnownStories: [Story]
    var story: Story
    var width: CGFloat
    var randomizeTile: ((Story) -> Void)?
    var resetStory: ((Story) -> Void)?
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(wellKnownStories) { story in
                    NavigationLink(destination: WellKnownStoryCreationView(userStories: $stories, story: story, randomizeTile: randomizeTile, resetStory: resetStory)) {
                        VStack {
                            ZStack {
                                MinimizedStoryView(story: story, width: width, covers: [])
                            }
                        }
                    }
                }
            }
        }
    }
}

struct WellKnownStoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        WellKnownStoryRowView(stories: .constant([]), wellKnownStories: [], story: Story.byDefault, width: 100)
    }
}
