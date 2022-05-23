//
//  WellKnownStoryCreationView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 24/11/21.
//

import SwiftUI

struct WellKnownStoryCreationView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var userStories: [Story]
    var story: Story
    var randomizeTile: ((Story) -> Void)?
    var resetStory: ((Story) -> Void)?
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(story.name)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                Spacer()
                Button(action: {
                    randomizeTile?(story)
                }) {
                    Label("Randomize", systemImage: "dice.fill")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.customSystemBlue.cornerRadius(15))
                }
            }
            .padding()
            
            TileListView(story: story)
            
            Button(action: {
                userStories.insert(story, at: 0)
                resetStory?(story)
                presentationMode.wrappedValue.dismiss()
            }) {
                LabelButtonView(label: "Create", image: "paintbrush.fill", color: .customSystemBlue)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct WellKnownStoryCreationView_Previews: PreviewProvider {
    static var previews: some View {
        WellKnownStoryCreationView(userStories: .constant([]), story: Story.byDefault)
    }
}
