//
//  LibraryTitleView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct LibraryTitleView: View {
    var title: String
    var body: some View {
        Text(title)
            .fontWeight(.semibold)
            .font(.title3)
    }
}

struct LibraryTitleView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryTitleView(title: "")
    }
}
