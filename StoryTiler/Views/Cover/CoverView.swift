//
//  CoverView.swift
//  StoryTilingProject
//
//  Created by Maertens Yann-Christophe on 20/11/21.
//

import SwiftUI

struct CoverView: View {
    @EnvironmentObject var vm: StoryViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlert = false
    @State var isShowingPicture = false
    @State var isShowingPhotos = false
    @State var isOpeningCamera = false
    @State var imageSelected = UIImage()
    @State var hasSelected = false
    
    var story: Story
    var saveImage: ((Story, UIImage) -> Void)?
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    CoverImagePresentationView(width: geometry.size.width, covers: vm.covers, isShowingPicture: $isShowingPicture, imageSelected: $imageSelected, hasSelected: $hasSelected)
                    Spacer()
                    Text("Make your story cover unique...")
                        .fontWeight(.bold)
                        .font(.title3)
                    Spacer()
                    HStack {
                        VStack {
                            Button(action: {
                                isShowingPicture = true
                                isShowingPhotos = true
                            }) {
                                CoverButtonView(image: "folder", height: geometry.size.height)
                            }
                            Text("With your photos")
                                .fontWeight(.bold)
                        }
                        .padding(.trailing)
                        
                        VStack {
                            Button(action: {
                                isShowingPicture = true
                                isOpeningCamera = true
                            }) {
                                CoverButtonView(image: "camera", height: geometry.size.height)
                            }
                            Text("With your camera")
                                .fontWeight(.bold)
                        }
                        .padding(.leading)
                        
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        saveImage?(story, imageSelected)
                        showingAlert = true
                    }) {
                        LabelButtonView(label: "Save", image: "square.and.arrow.down.fill", color: vm.covers.isEmpty && !hasSelected ? .gray : .customSystemBlue)
                            .alert(isPresented: $showingAlert) {
                                Alert(title: Text("Well done!"), message: Text("Your story has been correctly saved."), dismissButton: .default(Text("OK"), action: {
                                    isShowingPicture = false
                                    presentationMode.wrappedValue.dismiss()
                                }))
                            }
                    }
                    .disabled(vm.covers.isEmpty && !hasSelected)
                }
            }
            .padding()
            .navigationTitle("Cover")
        }
        .onAppear {
            if !vm.covers.isEmpty {
                if let cover = vm.covers[0] {
                    imageSelected = cover
                }
            }
        }
        .sheet(isPresented: $isShowingPhotos) {
            ImagePicker(selectedImage: $imageSelected, hasSelected: $hasSelected, sourceType: .photoLibrary)
        }
        .sheet(isPresented: $isOpeningCamera) {
            ImagePicker(selectedImage: $imageSelected, hasSelected: $hasSelected, sourceType: .camera)
        }
    }
}

struct CoverView_Previews: PreviewProvider {
    static var previews: some View {
        CoverView(story: Story.byDefault)
            .environmentObject(StoryViewModel())
    }
}

struct CoverButtonView: View {
    var image: String
    var height: CGFloat
    var body: some View {
        Image(systemName: image)
            .font(.largeTitle)
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(Color.customSystemBlue.cornerRadius(15))
    }
}

struct CoverImageListView: View {
    var images: [UIImage?]
    var width: CGFloat
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image in
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: width, height: width)
                        .cornerRadius(15)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

struct CoverImagePresentationView: View {
    var width: CGFloat
    var covers: [UIImage?]
    @Binding var isShowingPicture: Bool
    @Binding var imageSelected : UIImage
    @Binding var hasSelected: Bool
    var body: some View {
        ZStack {
            if hasSelected && isShowingPicture {
                Image(uiImage: imageSelected)
                    .resizable()
                    .scaledToFill()
                    .clipped()
            } else if !covers.isEmpty {
                CoverImageListView(images: covers, width: width)
            } else {
                Image("adventureCover")
                    .resizable()
                    .scaledToFill()
                    .clipped()
            }
        }
        .frame(width: width, height: width)
        .cornerRadius(15)
    }
}
