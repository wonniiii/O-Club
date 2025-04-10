//
//  MainViewModel.swift
//  O'Club
//
//  Created by 최효원 on 4/10/25.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    @Published var club: Club
    @Published var desiredColor: Color
    
    init(club: Club, desiredColor: Color) {
        self.club = club
        self.desiredColor = desiredColor
    }
    
    func createReport() {
        print("활동보고서 작성 tapped")
    }
    
    func viewTapped() {
        print("View tapped")
    }
}
