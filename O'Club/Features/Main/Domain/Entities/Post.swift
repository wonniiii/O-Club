//
//  Post.swift
//  O'Club
//
//  Created by 최효원 on 4/11/25.
//

import SwiftUI

struct Post: Identifiable {
    let id: String
    let title: String
    let content: String?
    let imageName: String?
    let authorUid: String
    let isPinned: Bool
    let createdAt: Date
}

