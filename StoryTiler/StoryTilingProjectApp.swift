//
//  StoryTilingProjectApp.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

import SwiftUI

@main
struct StoryTilingProjectApp: App {
    @StateObject var vm = StoryViewModel()
    var body: some Scene {
        WindowGroup {
            LibraryView()
                .environmentObject(vm)
        }
    }
}
