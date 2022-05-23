//
//  DetailQuestionView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct DetailQuestionView: View {
    @Environment(\.presentationMode) var presentationMode
    var story: Story
    var tile: Tile
    var question: Question
    var applyAnswer: ((Story, Tile, Question, String) -> Void)?
    @State var text: String = ""
    @FocusState private var isFocusing: Bool
    private let placeholder = "Type here"
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(question.entitled)
                    .font(.title)
                    .bold()
                    .padding()
                QuestionEditorView(text: $text)
                    .focused($isFocusing)
                    .background(Color(UIColor.systemGray5).cornerRadius(15).padding())
                    .overlay(
                        Text(text.isEmpty ? placeholder : "")
                            .font(.title)
                            .foregroundColor(Color.gray)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding(.leading, 37)
                            .padding(.top, 40)
                            .onTapGesture {
                                isFocusing = true
                            }
                    )
                Spacer()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if isFocusing {
                    Button("Done") {
                        isFocusing = false
                        presentationMode.wrappedValue.dismiss()
                        applyAnswer?(story, tile, question, text)
                    }
                }
            }
        }
        .onAppear {
            text = question.answer
        }
        .navigationBarBackButtonHidden(isFocusing)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailQuestionView(story: Story.byDefault, tile: Tile.byDefault, question: Question(entitled: "What's your name", answer: ""))
    }
}
