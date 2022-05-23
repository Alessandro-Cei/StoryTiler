//
//  TextFieldStoryNameView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct TextFieldStoryNameView: View {
    var name: String
    var height: CGFloat
    @Binding var text: String
    @Binding var isEditing: Bool
    @Binding var isBlurring: Bool
    var body: some View {
        if isEditing {
            TextField(name, text: $text)
                .font(.title)
                .padding(.leading, 40)
                .frame(height: height * 0.05)
                .overlay(
                    Image(systemName: "pencil")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                )
                .onSubmit {
                    if isBlurring {
                        isBlurring.toggle()
                    }
                }
                .onTapGesture {
                    if !isBlurring {
                        isBlurring.toggle()
                    }
                }
        } else {
            Text(name)
                .font(.title)
                .padding(.leading)
                .frame(height: height * 0.05)
        }
    }
}

struct TextFieldStoryNameView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldStoryNameView(name: "", height: 100, text: .constant(""), isEditing: .constant(false), isBlurring: .constant(false))
    }
}
