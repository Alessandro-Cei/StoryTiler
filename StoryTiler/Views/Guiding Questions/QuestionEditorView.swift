//
//  QuestionEditorView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct QuestionEditorView: View {
    @Binding var text: String
    var body: some View {
        TextEditor(text: $text)
            .font(.title)
            .cornerRadius(15)
            .padding()
            .padding()
    }
}

struct QuestionEditorView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionEditorView(text: .constant(""))
    }
}
