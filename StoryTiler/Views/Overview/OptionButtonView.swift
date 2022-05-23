//
//  CancelDoneButtonsView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct OptionButtonView: View {
    var actionName: String
    var body: some View {
        Text(actionName)
            .foregroundColor(.accentColor)
    }
}

struct OptionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        OptionButtonView(actionName: "")
    }
}
