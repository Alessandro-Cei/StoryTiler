//
//  LibraryRowView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct LibraryRowView: View {
    var stories: [Story]
    var width: CGFloat
    var covers: [UIImage?]
    var deleteStory: ((Story) -> Void)?
    var toggleFavorite: ((Story) -> Void)?
    var applyNameChange: ((Story, String) -> Void)?
    var applyAnswer: ((Story, Tile, Question, String) -> Void)?
    var saveImage: ((Story, UIImage) -> Void)?
    func backgroundColor(story: Story) -> Color {
        story.coverID == nil ? Color.gray : Color.clear
    }
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(stories) { story in
                    NavigationLink(destination: StoryOverviewView(story: story, deleteStory: deleteStory, toggleFavorite: toggleFavorite, applyNameChange: applyNameChange, applyAnswer: applyAnswer, saveImage: saveImage)) {
                        VStack {
                            ZStack {
                                MinimizedStoryView(story: story, width: width, covers: covers)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct LibraryRowView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryRowView(stories: [], width: 100, covers: [])
    }
}
