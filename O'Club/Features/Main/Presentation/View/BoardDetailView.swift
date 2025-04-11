//
//  BoardDetailView.swift
//  O'Club
//
//  Created by 최효원 on 4/11/25.
//

import SwiftUI

struct BoardDetailView: View {
    var body: some View {
        ZStack {
            Color.allBackground.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                NavigationBar(title: "게시판 상세", rightButtonTitle: nil, rightButtonAction: nil)
                
                Spacer().frame(height: 40)
                Image("onsFC")
                    .resizable()
                    .frame(height: 200)
                    .padding(.horizontal, 20)
                
                Spacer().frame(height: 30)
           
                Text("3월 정기 모임 사진입니다 !")
                    .font(.title3).bold()
                    .padding(.horizontal, 20)
                    .padding(.bottom, 12)
                Text("AM 2팀 최효원")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                Text("게시물 상세 게시물 상세 게시물 상세 게시물 상세 게시물 상세")
                    .font(.footnote)
                    .padding(.horizontal, 20)
                Spacer()
            }
            
        }
    }
}

#Preview {
    BoardDetailView()
}
