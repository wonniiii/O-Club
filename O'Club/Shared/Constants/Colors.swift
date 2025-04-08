//
//  Colors.swift
//  O'Club
//
//  Created by 최효원 on 4/7/25.
//

import SwiftUI

// hex 코드를 사용하기 위한 Color Extension
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
    
    static let cjRed = Color(hex: 0xEF151E)
    static let cjYellow = Color(hex: 0xFF9700)
    static let lightGray = Color(hex: 0x828488)
    static let secondaryGray = Color(hex: 0xFFFFFF)
    static let boardBlue = Color(hex: 0x0D265E)
    static let lightBlue = Color(hex: 0xDFF1FF)
    static let lightYellow = Color(hex: 0xFFFBEB)
    static let lightRed = Color(hex: 0xFFECEF)
}

