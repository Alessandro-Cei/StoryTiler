//
//  StoryOverviewView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 19/11/21.
//

struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(
            effect: UIBlurEffect(style: style)
        )
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //        do nothing
    }
}

public extension UIApplication {
    static func dismissKeyboard() {
        let keyWindow = shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        keyWindow?.endEditing(true)
    }
}

import SwiftUI

struct StoryOverviewView: View {
    var story: Story
    @State var text: String = ""
    @State private var isEditing = false
    @State private var isAlertShowing = false
    @State private var isBlurring = false
    var deleteStory: ((Story) -> Void)?
    var toggleFavorite: ((Story) -> Void)?
    var applyNameChange: ((Story, String) -> Void)?
    var applyAnswer: ((Story, Tile, Question, String) -> Void)?
    var saveImage: ((Story, UIImage) -> Void)?
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    if isEditing {
                        TextFieldStoryNameView(name: story.name, height: geometry.size.height, text: $text, isEditing: $isEditing, isBlurring: $isBlurring)
                    }
                    ZStack{
                        VStack {
                            StoryTileListView(story: story, applyAnswer: applyAnswer)
                                .disabled(isEditing)
                            Spacer()
                            CustomizeButtonView(story: story, isEditing: $isEditing, isAlertShowing: $isAlertShowing, toggleFavorite: toggleFavorite, saveImage: saveImage)
                            Spacer()
                        }
                        if isBlurring {
                            BlurView(style: .regular)
                                .onTapGesture{
                                    if isBlurring {
                                        UIApplication.dismissKeyboard()
                                        isBlurring.toggle()
                                    }
                                }
                        }
                    }
                }
                .navigationTitle(story.name)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        if !isEditing {
                            Button("Edit")
                            {
                                isEditing.toggle()
                            }
                            .foregroundColor(.blue)
                        } else {
                            Button("Done"){
                                applyNameChange?(story, text)
                                text = ""
                                isEditing.toggle()
                                if isBlurring {
                                    isBlurring.toggle()
                                }
                            }
                            .foregroundColor(.blue)
                        }
                    }
                }
                .confirmationDialog("", isPresented: $isAlertShowing, actions: {
                    Button("Delete story", role: .destructive) {
                        deleteStory?(story)
                    }
                    Button("Cancel", role: .cancel) { }
                }, message: {
                    Text("This story will be deleted permanently.")
                })
            }
        }
        .navigationBarBackButtonHidden(isEditing)
    }
}

struct StoryOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StoryOverviewView(story: Story.byDefault)
        }
    }
}
