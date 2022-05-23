//
//  CreationStoryView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct CreationStoryView: View {
    @ObservedObject var vm: StoryViewModel
    @Binding var isPresented: Bool
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                isPresented.toggle()
            }) {
                Text("Cancel")
                    .foregroundColor(.accentColor)
            }
            .padding()
            
            HStack {
                Text(vm.story.name)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                Spacer()
                Button(action: {
                    vm.randomizeStory()
                }) {
                    Label("Randomize", systemImage: "dice.fill")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.customSystemBlue.cornerRadius(15))
                }
            }
            .padding()
            
            TileListView(story: vm.story)
            
            Button(action: {
                vm.userStories.insert(vm.story, at: 0)
                isPresented.toggle()
                vm.randomizeStory()
            }) {
                LabelButtonView(label: "Create", image: "paintbrush.fill", color: .customSystemBlue)
            }
            .padding()
        }
    }
}

struct CreationStoryView_Previews: PreviewProvider {
    static var previews: some View {
        CreationStoryView(vm: StoryViewModel(), isPresented: .constant(false))
    }
}
