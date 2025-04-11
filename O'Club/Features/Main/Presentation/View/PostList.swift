//
//  PostList.swift
//  O'Club
//
//  Created by 최효원 on 4/10/25.
//

import SwiftUI

struct PostList: View {
    let post: Post
    
    var body: some View {
        HStack {
            postImage
            postDetails
        }
        .frame(height: 100)
        .background(cardBackground)
        .padding(.horizontal, 5)
    }
}

private extension PostList {
    var postImage: some View {
        Image(post.imageName ?? "")
            .resizable()
            .frame(width: 80, height: 72)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(12)
    }
    
    // 게시글 상세 정보 영역
    var postDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(post.title)
                .font(.subheadline)
                .bold()
                .foregroundStyle(Color.boardBlue)
            Text(post.content ?? "")
                .font(.caption)
                .foregroundStyle(Color.lightGray)
            
            HStack(spacing: 2) {
                Image(systemName: "clock")
                Text(post.createdAt.formattedString)
            }
            .font(.caption)
            .foregroundStyle(Color.dateGray)
        }
        .padding(.trailing)
    }
    
    var cardBackground: some View {
        ZStack(alignment: .topTrailing) {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: Color.shadowBlue.opacity(0.15), radius: 2)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(post.isPinned ? Color.cjYellow : Color.clear, lineWidth: post.isPinned ? 1 : 0)
                )
            if post.isPinned {
                Image("noticeBadge")
                    .resizable()
                    .frame(width: 20, height: 28)
                    .offset(x: -12, y:-5)
            }
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        PostList(post: Post(
            id: "1",
            title: "동호회 이름 변경 공모전",
            content: "안녕하세요 여러분 오랜만이에요. 오늘은...",
            imageName: "onsFC",
            authorUid: "최효원",
            isPinned: true,
            createdAt: Date()
        ))
        
        PostList(post: Post(
            id: "1",
            title: "동호회 이름 변경 공모전",
            content: "안녕하세요 여러분 오랜만이에요. 오늘은...",
            imageName: "onsFC",
            authorUid: "최효원",
            isPinned: false,
            createdAt: Date()
        ))
    }
}
