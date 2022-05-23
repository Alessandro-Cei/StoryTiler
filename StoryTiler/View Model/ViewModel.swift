//
//  ViewModel.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

class StoryViewModel: ObservableObject {
    @Published var userStories = [Story]()
    @Published var wellKnownStories = Story.data
    @Published var story: Story = Story(name: "New Story", coverID: nil, tiles: [], isFavorite: false)
    @Published var coverID = 0
    @Published var covers: [UIImage?] = []
    
    var favoriteStories: [Story] {
        return userStories.filter { $0.isFavorite }
    }
    
    var randomTiles: [Tile] {
        guard let randomIncipit = Tile.data.filter({ $0.category.name == .incipit }).randomElement() else { return [] }
        guard let randomAdventure = Tile.data.filter({ $0.category.name == .adventure }).randomElement() else { return [] }
        guard let randomConflict = Tile.data.filter({ $0.category.name == .conflict }).randomElement() else { return [] }
        guard let randomResolution = Tile.data.filter({ $0.category.name == .resolution }).randomElement() else { return [] }
        
        return [randomIncipit, randomAdventure, randomConflict, randomResolution]
    }
    
    func randomizeStory() {
        story = Story(name: "New Story", coverID: nil, tiles: [], isFavorite: false)
        story.tiles = randomTiles
    }
    func deleteStory(story: Story) {
        guard let firstIndex = userStories.firstIndex(where: { $0 == story }) else { return }
        userStories.remove(at: firstIndex)
    }
    func toggleFavorite(story: Story) {
        if let match = userStories.firstIndex(where: { $0 == story }) {
            userStories[match].isFavorite.toggle()
        }
    }
    func changeStoryName(story: Story, name: String) {
        if let match = userStories.firstIndex(where: { $0 == story }) {
            if !name.isEmpty {
                userStories[match].name = name
            }
        }
    }
    func applyAnswer(story: Story, tile: Tile, question: Question, answer: String) {
        if let storyIndex = userStories.firstIndex(where: { $0 == story }) {
            if let tileIndex = userStories[storyIndex].tiles.firstIndex(where: { $0 == tile }) {
                if let questionIndex = userStories[storyIndex].tiles[tileIndex].category.questions.firstIndex(where: { $0 == question }) {
                    userStories[storyIndex].tiles[tileIndex].category.questions[questionIndex].answer = answer
                }
            }
        }
    }
    func saveImage(story: Story, cover: UIImage) {
        if let match = userStories.firstIndex(where: { $0 == story }) {
                covers.append(cover)
                userStories[match].coverID = coverID
                coverID += 1
        }
    }
    func randomizeTile(story: Story) {
        guard let firstIndex = wellKnownStories.firstIndex(where: { $0.name == story.name }) else { return }
        guard let randomIndex = wellKnownStories[firstIndex].tiles.indices.randomElement() else { return }
        let tiles = Tile.data.filter { !wellKnownStories[firstIndex].tiles.contains($0) }
        let filteredTiles = tiles.filter { $0.category.name == wellKnownStories[firstIndex].tiles[randomIndex].category.name }
        guard let randomTile = filteredTiles.randomElement() else { return }
        repeat {
            wellKnownStories[firstIndex].tiles[randomIndex] = randomTile
        } while wellKnownStories[firstIndex].tiles[randomIndex] != randomTile
    }
    
    func resetStory(story: Story) {
        guard let firstStory = Story.data.first(where: { $0.name == story.name }) else { return }
        guard let index = wellKnownStories.firstIndex(where: { $0.name == story.name }) else { return }
        wellKnownStories[index] = firstStory
    }
    
    init() {
        randomizeStory()
    }
}
