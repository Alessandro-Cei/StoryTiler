//
//  GuidingQuestionHeaderView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct GuidingQuestionHeaderView: View {
    var tile: Tile
    var width: CGFloat
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(tile.image)
                .resizable()
                .scaledToFit()
                .scaleEffect(0.9)
                .background(tile.category.name.color.cornerRadius(15))
                .frame(width: width * 0.3, height: width * 0.3)
            
            VStack(alignment: .leading) {
                Text(tile.name)
                    .font(.title2)
                    .bold()
                Divider()
                Text(tile.description)
                    .font(.title3)
            }
        }
        .padding()
    }
}

struct GuidingQuestionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        GuidingQuestionHeaderView(tile: Tile.data[0], width: 100)
    }
}
