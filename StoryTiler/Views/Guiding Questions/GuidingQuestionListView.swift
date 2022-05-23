//
//  GuidedQuestionListView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct GuidingQuestionListView: View {
    var story: Story
    var tile: Tile
    var applyAnswer: ((Story, Tile, Question, String) -> Void)?
    var body: some View {
        List(tile.category.questions) { question in
            NavigationLink(destination: DetailQuestionView(story: story, tile: tile, question: question, applyAnswer: applyAnswer)) {
                Text(question.entitled)
                    .font(.title)
                    .padding()
            }
        }
        .listStyle(.plain)
    }
}

struct GuidingQuestionListView_Previews: PreviewProvider {
    static var previews: some View {
        GuidingQuestionListView(story: Story.byDefault, tile: Tile.data[0])
    }
}
