//
//  WriteBottomSheet.swift
//  O'Club
//
//  Created by 최효원 on 4/11/25.
//

import SwiftUI
import PhotosUI

struct WriteBottomSheet: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil
    
    @State private var postContent: String = ""
    @State private var postTitle: String = ""
    
    var body: some View {
        VStack {
            ZStack {
                Text("게시글 작성")
                    .font(.body)
                    .foregroundStyle(.black)
                HStack {
                    Button(action: { dismiss() }) {
                        Text("Cancel")
                            .font(.body)
                            .foregroundStyle(.black)
                    }
                    
                    Spacer()
                    
                    PhotosPicker(
                        selection: $selectedItem,
                        matching: .images,
                        photoLibrary: .shared()
                    ) {
                        Image(systemName: "paperclip")
                            .font(.body)
                            .foregroundStyle(.black)
                    }
                    .onChange(of: selectedItem) { newItem in
                        guard let newItem = newItem else { return }
                        Task {
                            if let data = try? await newItem.loadTransferable(type: Data.self),
                               let uiImage = UIImage(data: data) {
                                selectedImage = uiImage
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, minHeight: 44)
            .padding(.horizontal)
            .padding(.top, 12)
            .padding(.bottom, 6)
            .background(Color.white)
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.black.opacity(0.1)),
                alignment: .bottom
            )
            
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 200)
                    .padding(.horizontal)
            }
            
            Spacer().frame(height: 28)
            
            TextField("제목을 입력해주세요", text: $postTitle)
                .padding(12)
                .background(Color.white)
                .cornerRadius(16)
                .padding(.horizontal)
            
            Spacer().frame(height: 20)

            TextEditor(text: $postContent)
                .overlay(alignment: .topLeading) {
                    Text("내용을 입력해주세요")
                        .foregroundStyle(postContent.isEmpty ? Color.secondary.opacity(0.5) : .clear)
                        .font(.callout)
                        .padding(11)
                }
                .padding(12)
                .background(Color.white)
                .cornerRadius(20)
                .padding(.horizontal)
                .frame(maxHeight: .infinity)
            
            Spacer()
        }
        .background(Color.allBackground.ignoresSafeArea())
    }
}

#Preview {
    WriteBottomSheet()
}
