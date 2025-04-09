//
//  LoginView.swift
//  O'Club
//
//  Created by 최효원 on 4/7/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        VStack(spacing: 12) {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(height: 220)
                .padding(.horizontal, 70)

            // 사번 입력
            InputField(
                placeholder: "사번을 입력하세요",
                text: $viewModel.employeeNumber,
                isSecure: false
            )

            // 아이디 입력
            InputField(
                placeholder: "CJ World 아이디를 입력하세요",
                text: $viewModel.userId,
                isSecure: false
            )

            // 비밀번호 입력
            InputField(
                placeholder: "CJ World 비밀번호를 입력하세요",
                text: $viewModel.password,
                isSecure: true
            )

            // 하단 로고
            Image("onsLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 40)
                .padding(.top, 30)
        }
        .padding(.horizontal, 24)
    }
}


struct InputField: View {
    let placeholder: String
    @Binding var text: String
    let isSecure: Bool

    var body: some View {
        Group {
            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
        }
        .padding()
        .background(Color(uiColor: .secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}


#Preview {
    LoginView()
}
