//
//  Extensions.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

extension Bundle {
    func decode<T: Decodable>(_ resource: String) -> [T] {
        if let url = url(forResource: resource, withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let decodedData = try? JSONDecoder().decode([T].self, from: data) {
            return decodedData
        }
        return []
    }
}
