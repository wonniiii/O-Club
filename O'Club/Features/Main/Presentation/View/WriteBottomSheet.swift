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
    @StateObject private var viewModel = WriteBottomSheetViewModel()
    
    var body: some View {
        VStack{
            headerView
            
            if let image = viewModel.selectedImage {
                imagePreview(image: image)
            }
            
            Spacer().frame(height: 28)
            
            titleTextField
            
            Spacer().frame(height: 20)
            
            contentTextEditor
            
            Spacer()
        }
        .background(Color.allBackground.ignoresSafeArea())
    }
}

private extension WriteBottomSheet {
    
    var headerView: some View {
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
                    selection: $viewModel.selectedItem,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    Image(systemName: "paperclip")
                        .font(.body)
                        .foregroundStyle(.black)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, minHeight: 44)
        .padding(.top, 12)
        .padding(.bottom, 6)
        .background(Color.white)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.black.opacity(0.1)),
            alignment: .bottom
        )
    }
    
    func imagePreview(image: UIImage) -> some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: 200)
            .cornerRadius(8)
            .padding(.horizontal)
            .padding(.top, 10)
    }
    
    var titleTextField: some View {
        TextField("제목을 입력해주세요", text: $viewModel.postTitle)
            .padding(12)
            .background(Color.white)
            .cornerRadius(16)
            .padding(.horizontal)
    }
    
    var contentTextEditor: some View {
        TextEditor(text: $viewModel.postContent)
            .overlay(alignment: .topLeading) {
                Text("내용을 입력해주세요")
                    .foregroundStyle(viewModel.postContent.isEmpty ? Color.secondary.opacity(0.5) : .clear)
                    .font(.callout)
                    .padding(11)
            }
            .padding(12)
            .background(Color.white)
            .cornerRadius(20)
            .padding(.horizontal)
            .frame(maxHeight: .infinity)
    }
}


#Preview {
    WriteBottomSheet()
}
