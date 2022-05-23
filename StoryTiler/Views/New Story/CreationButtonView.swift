//
//  CreationButtonView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

struct CreationButtonView: View {
    var body: some View {
        Text("Create")
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.customSystemBlue.cornerRadius(15))
            .padding(.horizontal)
    }
}

struct CreationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CreationButtonView()
    }
}
