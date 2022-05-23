//
//  TileModel.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import Foundation

struct Tile: Identifiable, Hashable, Decodable {
    let id = UUID()
    var name: String
    var image: String
    var category: Category
    var description: String
    
    private enum CodingKeys : String, CodingKey { case name, image, category, description }
}

extension Tile  {
    static let byDefault = Tile(name: "Default", image: "spider", category: Category(name: .incipit, questions: []), description: "description")
    static var data: [Tile] {
        Bundle.main.decode("Tiles")
    }
}
