//
//  StoryTileListView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct StoryTileListView: View {
    var story: Story
    var applyAnswer: ((Story, Tile, Question, String) -> Void)?
    var body: some View {
        GeometryReader { geometry in
            List(story.tiles) { tile in
                NavigationLink(destination: GuidingQuestionView(story: story, tile: tile, applyAnswer: applyAnswer)) {
                    TileRowView(tile: tile, width: geometry.size.width)
                }
            }
            .listStyle(.plain)
        }
    }
}

struct StoryTileListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryTileListView(story: Story.byDefault)
    }
}
