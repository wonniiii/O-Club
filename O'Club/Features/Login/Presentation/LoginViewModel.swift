//
//  LoginViewModel.swift
//  O'Club
//
//  Created by 최효원 on 4/9/25.
//

import SwiftUI

final class LoginViewModel: ObservableObject {
    @Published var employeeNumber: String = ""
    @Published var userId: String = ""
    @Published var password: String = ""

    func login() {
        print("Logging in with: \(employeeNumber), \(userId), \(password)")
    }
}
