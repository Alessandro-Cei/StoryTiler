//
//  TileRowView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct TileRowView: View {
    var tile: Tile
    var width: CGFloat
    var body: some View {
        HStack(alignment: .top) {
            Image(tile.image)
                .resizable()
                .scaledToFit()
                .frame(width: width * 0.2, height: width * 0.2)
                .padding()
                .background(tile.category.name.color.cornerRadius(15))
            VStack(alignment: .leading) {
                Text(tile.category.name.rawValue.capitalized)
                    .fontWeight(.bold)
                    .font(.title)
                Text(tile.name)
                    .fontWeight(.semibold)
                    .font(.title3)
                Text(tile.description)
                    .font(.callout)
            }
        }
    }
}

struct TileRowView_Previews: PreviewProvider {
    static var previews: some View {
        TileRowView(tile: Tile.byDefault, width: 100)
    }
}
