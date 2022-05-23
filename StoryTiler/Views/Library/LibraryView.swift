//
//  LibraryView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct LibraryView: View {
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    @EnvironmentObject var vm: StoryViewModel
    @State var isPresented = false
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    UserStoriesListView(userStories: vm.userStories, width: geometry.size.width, covers: vm.covers, deleteStory: vm.deleteStory, toggleFavorite: vm.toggleFavorite, applyNameChange: vm.changeStoryName, applyAnswer: vm.applyAnswer, saveImage: vm.saveImage)
                    FavoriteStoriesListView(favoriteStories: vm.favoriteStories, width: geometry.size.width, covers: vm.covers, deleteStory: vm.deleteStory, toggleFavorite: vm.toggleFavorite, applyNameChange: vm.changeStoryName, applyAnswer: vm.applyAnswer, saveImage: vm.saveImage)
                    WellKnownStoriesListView(stories: $vm.userStories, wellKnownStories: vm.wellKnownStories, story: vm.story, width: geometry.size.width, randomizeTile: vm.randomizeTile, resetStory: vm.resetStory)
                }
            }
            .padding()
            .navigationTitle("Library")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NewStoryButtonView(isPresented: $isPresented)
                }
            }
            .fullScreenCover(isPresented: $isPresented) {
                CreationStoryView(vm: vm, isPresented: $isPresented)
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .environmentObject(StoryViewModel())
            .preferredColorScheme(.light)
    }
}
