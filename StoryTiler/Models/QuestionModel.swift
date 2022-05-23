//
//  QuestionModel.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import Foundation

struct Question: Identifiable, Hashable, Decodable {
    let id = UUID()
    let entitled: String
    var answer: String
    
    private enum CodingKeys : String, CodingKey { case entitled, answer }
}

extension Question {
    static let byDefault = Question(entitled: "Question?", answer: "Answer")
}
