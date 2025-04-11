//
//  Date.swift
//  O'Club
//
//  Created by 최효원 on 4/11/25.
//

import SwiftUI

extension Date {
    var formattedString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: self)
    }
}
