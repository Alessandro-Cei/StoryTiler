//
//  NewStoryButtonView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct NewStoryButtonView: View {
    @Binding var isPresented: Bool
    var body: some View {
        Button(action: {
            isPresented.toggle()
        }) {
            Image(systemName: "plus.circle.fill")
                .font(.title)
                .foregroundColor(.customSystemBlue)
                .padding(5)
        }
    }
}

struct NewStoryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NewStoryButtonView(isPresented: .constant(false))
    }
}
