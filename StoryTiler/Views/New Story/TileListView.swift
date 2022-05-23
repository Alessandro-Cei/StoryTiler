//
//  TileListView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct TileListView: View {
    var story: Story
    var body: some View {
        GeometryReader { geometry in
            List(story.tiles) { tile in
                TileRowView(tile: tile, width: geometry.size.width)
            }
            .listStyle(.plain)
        }
    }
}

struct TileListView_Previews: PreviewProvider {
    static var previews: some View {
        TileListView(story: Story.byDefault)
    }
}
