//
//  ContentView.swift
//  O'Club
//
//  Created by 최효원 on 4/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView {
                MainView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("홈")
                    }
                CalendarView()
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("일정")
                    }
                IntroductionView()
                    .tabItem {
                        Image(systemName: "person.3")
                        Text("소개")
                    }
                FAQView()
                    .tabItem {
                        Image(systemName: "questionmark.circle")
                        Text("FAQ")
            }
        }
    }
}

#Preview {
    ContentView()
}
