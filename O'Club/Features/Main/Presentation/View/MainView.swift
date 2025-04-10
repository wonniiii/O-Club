//
//  MainView.swift
//  O'Club
//
//  Created by 최효원 on 4/7/25.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        ZStack {
            Color.allBackground
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("안녕하세요 최효원님 🙌")
                    .font(.callout)
                    .padding(.bottom, 4)
                Text("사내 동호회 O'Club")
                    .font(.title).bold()
                
                CardContainerView(desiredColor: .cjRed, onOverlayTap: {
                    print("빨간 카드 탭")
                }) {
                    MainCardContentView(club: sampleClubRed)
                }
                
                .padding(.bottom, 20)
                
                CardContainerView(desiredColor: .cjYellow, onOverlayTap: {
                    print("노란 카드 탭")
                }) {
                    MainCardContentView(club: sampleClubYellow)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, (UIScreen.current?.bounds.height)! * 0.1)
        }
    }
}


let sampleClubRed = Club(
    imageName: "testLogo",
    name: "옳지 OI-chi",
    type: "댄스 동호회",
    infoItems: [
        InfoItem(title: "여가", type: .category),
        InfoItem(title: "월 1회", type: .frequency),
        InfoItem(title: "24명", type: .personNumber)
    ],
    description: "우리는 좋아하는 가수의 춤을 쉽게 재밌게 배우는 댄스 동호회예요! 초보든, 몸치든 상관없어요! 같이 배우고, 같이 춤추고, 같이 즐기면 끝!",
    meetingInfo: "미정"
)

let sampleClubYellow = Club(
    imageName: "testLogo",
    name: "CJ OneTheFC",
    type: "축구 동호회",
    infoItems: [
        InfoItem(title: "스포츠", type: .category),
        InfoItem(title: "월 2회", type: .frequency),
        InfoItem(title: "31명", type: .personNumber)
    ],
    description: "20년 넘게 이어져 온 역사와 전통이 살아있는 CJ 올리브네트웍스 축구동호회입니다.스트레스 해소, 체력 증진은 물론 회사 내 다양한 인맥은 덤!",
    meetingInfo: "D-5"
)


#Preview {
    MainView()
}
