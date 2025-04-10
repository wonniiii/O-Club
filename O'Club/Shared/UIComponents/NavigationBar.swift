//
//  NavigationBar.swift
//  O'Club
//
//  Created by 최효원 on 4/7/25.
//

import SwiftUI

struct NavigationBar: View {
    let title: String
    let rightButtonTitle: String?
    let rightButtonAction: (() -> Void)?
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            // 중앙 제목
            Text(title)
                .font(.body)
                .foregroundStyle(.black)

            // 좌우 버튼
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.body)
                        .foregroundStyle(.black)
                }

                Spacer()

                if let rightTitle = rightButtonTitle, let action = rightButtonAction {
                    Button(action: action) {
                        Text(rightTitle)
                            .font(.body)
                            .foregroundStyle(.black)
                    }
                } else {
                    // 공간 확보용 투명 뷰
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 44, height: 44)
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 12)
        .padding(.bottom, 6)
    }
}

