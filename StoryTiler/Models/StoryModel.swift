//
//  StoryModel.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import Foundation

struct Story: Identifiable, Equatable, Decodable {
    let id = UUID()
    var name: String
    var coverID: Int?
    var tiles: [Tile]
    var isFavorite: Bool = false
    
    private enum CodingKeys : String, CodingKey { case name, coverID, tiles, isFavorite }
}

extension Story {
    static let byDefault = Story(name: "New Story", coverID: nil, tiles: [])
    static var data: [Story] {
        Bundle.main.decode("WellKnownStories")
    }
}
