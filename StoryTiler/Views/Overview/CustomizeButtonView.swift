//
//  CustomizeButtonView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct CustomizeButtonView: View {
    var story: Story
    @Binding var isEditing: Bool
    @Binding var isAlertShowing: Bool
    var toggleFavorite: ((Story) -> Void)?
    var saveImage: ((Story, UIImage) -> Void)?
    var body: some View {
        if !isEditing {
            NavigationLink(destination: CoverView(story: story, saveImage: saveImage)) {
                LabelButtonView(label: "Cover", image: "photo.on.rectangle.angled", color: .customSystemBlue)
                    .padding(.horizontal)
            }
        } else {
            VStack {
                HStack {
                    LabelButtonView(image: "trash", color: .customSystemRed)
                        .onTapGesture {
                            isAlertShowing.toggle()
                        }
                    LabelButtonView(image: story.isFavorite ? "heart.fill" : "heart", color: .customSystemBlue)
                        .onTapGesture {
                            toggleFavorite?(story)
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CustomizeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeButtonView(story: Story.byDefault, isEditing: .constant(false), isAlertShowing: .constant(false))
    }
}

struct LabelButtonView: View {
    var label: String?
    var image: String?
    var color: Color
    var body: some View {
        Label(label ?? "", systemImage: image ?? "multiply")
            .font(.title3)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(color.cornerRadius(15))
    }
}
