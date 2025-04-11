//
//  WriteBottomSheetViewModel.swift
//  O'Club
//
//  Created by 최효원 on 4/11/25.
//

import SwiftUI
import PhotosUI

final class WriteBottomSheetViewModel: ObservableObject {
    @Published var postTitle: String = ""
    @Published var postContent: String = ""
    @Published var selectedImage: UIImage? = nil
    @Published var selectedItem: PhotosPickerItem? = nil {
        didSet {
            if selectedItem != oldValue {
                Task { await loadSelectedImage() }
            }
        }
    }
    

    var newPost: Post {
        Post(
            id: UUID().uuidString,
            title: postTitle,
            content: postContent.isEmpty ? nil : postContent,
            imageName: selectedImage != nil ? "uploadedImagePlaceholder" : nil,
            authorUid: "currentUserId",
            isPinned: false,
            createdAt: Date()
        )
    }
    
    func loadSelectedImage() async {
        guard let item = selectedItem else {
            DispatchQueue.main.async { self.selectedImage = nil }
            return
        }
        if let data = try? await item.loadTransferable(type: Data.self),
           let image = UIImage(data: data) {
            DispatchQueue.main.async {
                self.selectedImage = image
            }
        }
    }
}
