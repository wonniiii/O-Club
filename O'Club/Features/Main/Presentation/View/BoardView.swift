//
//  BoardView.swift
//  O'Club
//
//  Created by 최효원 on 4/10/25.
//

import SwiftUI

struct BoardView: View {
    var body: some View {
        ZStack {
            Color.allBackground
                .ignoresSafeArea()
            VStack(spacing: 0) {
                NavigationBar(
                    title: "CJ OnTheFC",
                    rightButtonTitle: "작성하기",
                    rightButtonAction: { print("작성하기 클릭") }
                )
                
                Spacer().frame(height: 32)
                
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
                        id: "2",
                        title: "동호회 이름 변경 공모전",
                        content: "안녕하세요 여러분 오랜만이에요. 오늘은...",
                        imageName: "onsFC",
                        authorUid: "최효원",
                        isPinned: false,
                        createdAt: Date()
                    ))
                }
                
                Spacer()
            }
        }
    }
}


#Preview {
    BoardView()
}
