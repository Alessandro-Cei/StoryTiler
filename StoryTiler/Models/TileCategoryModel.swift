//
//  TileCategoryModel.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct Category: Hashable, Decodable {
    let name: TileCategory
    var questions: [Question]
}

enum TileCategory: String, Decodable {
    case incipit, adventure, conflict, resolution
    
    var color: Color {
        switch self {
        case .incipit:
            return .customGreen
        case .adventure:
            return .customBlue
        case .conflict:
            return .customRed
        case .resolution:
            return .customPurple
        }
    }
}
