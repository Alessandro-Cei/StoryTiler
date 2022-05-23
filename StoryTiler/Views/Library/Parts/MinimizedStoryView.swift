//
//  MinimizedStoryView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct MinimizedStoryView: View {
    var story: Story
    var width: CGFloat
    var tiles: [[Tile]] {
        story.tiles.separate(into: 2)
    }
    var covers: [UIImage?]
    var body: some View {
        if story.coverID != nil {
            CoverImageView(story: story, covers: covers, width: width)
        } else {
            VStack {
                ForEach(tiles, id: \.self) { row in
                    HStack {
                        ForEach(row) { tile in
                            Image(tile.image)
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(0.8)
                                .background(tile.category.name.color.cornerRadius(10))
                        }
                    }
                }
                Text(story.name)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
                    .font(.caption)
                    .frame(maxWidth: .infinity)
                Spacer()
            }
            .padding(5)
            .background(Color(UIColor.systemGray5).cornerRadius(15).shadow(color: Color(UIColor.systemGray3), radius: 0, x: 3, y: 3))
            .padding(.bottom, 10)
        }
    }
}

struct MinimizedStoryView_Previews: PreviewProvider {
    static var previews: some View {
        MinimizedStoryView(story: Story.byDefault, width: 100, covers: [])
    }
}

struct CoverImageView: View {
    var story: Story
    var covers: [UIImage?]?
    var width: CGFloat
    var body: some View {
        ZStack (alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color(UIColor.systemGray5))
                .overlay(
                    Text(story.name)
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                        .font(.callout)
                        .padding(5)
                        .frame(maxWidth: 150, maxHeight: 200, alignment: .bottom)
                )
            if let covers = covers,
               let id = story.coverID,
               let cover = covers[id] {
                Image(uiImage: cover)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 130)
                    .clipped()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .frame(maxWidth: 150, maxHeight: 200, alignment: .center)
        .padding(5)
        .shadow(color: Color(UIColor.systemGray3), radius: 0, x: 3, y: 3)
        .padding(.bottom, 10)
    }
}
