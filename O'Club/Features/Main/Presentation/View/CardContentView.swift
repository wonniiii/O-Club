//
//  MainCardContentView.swift
//  O'Club
//
//  Created by 최효원 on 4/10/25.
//

import SwiftUI

struct MainCardContentView: View {
    let club: Club
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ProfileHeaderView(
                imageName: club.imageName,
                clubName: club.name,
                clubType: club.type
            )
            
            HStack(spacing: 12) {
                ForEach(club.infoItems) { item in
                    CategoryCapsuleView(info: item)
                }
            }
            .font(.caption)
            .foregroundStyle(.white)
            
            Text(club.description)
                .font(.footnote)
                .foregroundStyle(.white)
            
            Spacer()
            
            BottomActionView(meetingInfo: club.meetingInfo)
        }
        .padding()
    }
}

// 카테고리 캡슐
struct CategoryCapsuleView: View {
    let info: InfoItem
    
    var body: some View {
        Label(info.title, systemImage: info.systemImageName)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(Capsule().strokeBorder(Color.white.opacity(0.6), lineWidth: 0.8))
            .background(Color.white.opacity(0.3))
            .clipShape(Capsule())
    }
}

// 프로필 헤더 뷰
struct ProfileHeaderView: View {
    let imageName: String
    let clubName: String
    let clubType: String
    
    var body: some View {
        HStack(alignment: .top) {
            Image(imageName)
                .resizable()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(clubName)
                    .font(.callout).bold()
                Text(clubType)
                    .font(.caption2)
            }
            Spacer()
        }
        .foregroundStyle(.white)
    }
}

// 하단 액션과 다음 모임 정보를 보여주는 뷰
struct BottomActionView: View {
    let meetingInfo: String
    
    var body: some View {
        HStack {
            Button("활동보고서 작성하기") {
                print("활동보고서 작성 tapped")
            }
            .font(.subheadline).bold()
            .foregroundStyle(.accent)
            
            Spacer()
            
            (
                Text("다음 모임 ")
                    .font(.footnote)
                +
                Text(meetingInfo)
                    .bold()
                    .font(.headline)
            )
        }
    }
}

