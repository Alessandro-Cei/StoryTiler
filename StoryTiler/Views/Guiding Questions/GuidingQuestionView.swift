//
//  GuidedQuestionView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct GuidingQuestionView: View {
    var story: Story
    var tile: Tile
    var applyAnswer: ((Story, Tile, Question, String) -> Void)?
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 20) {
                GuidingQuestionHeaderView(tile: tile, width: geometry.size.width)
                GuidingQuestionListView(story: story, tile: tile, applyAnswer: applyAnswer)
            }
            .navigationBarTitle("\(tile.category.name.rawValue.capitalized)")
        }
    }
}

struct GuidingQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GuidingQuestionView(story: Story.byDefault, tile: Tile.data[0])
        }
    }
}
