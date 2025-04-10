//
//  MainCardShape.swift
//  O'Club
//
//  Created by 최효원 on 4/10/25.
//

import SwiftUI

struct MainCardShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let curveRadius: CGFloat = 120.0
        let cornerRadius: CGFloat = 20.0
        
        // 좌하단 곡선
        path.move(to: CGPoint(x: cornerRadius, y: rect.height))
        path.addQuadCurve(
            to: CGPoint(x: 0, y: rect.height - cornerRadius),
            control: CGPoint(x: 0, y: rect.height)
        )
        
        // 좌측 세로선 및 좌상단 곡선
        path.addLine(to: CGPoint(x: 0, y: cornerRadius))
        path.addQuadCurve(
            to: CGPoint(x: cornerRadius, y: 0),
            control: CGPoint(x: 0, y: 0)
        )
        
        // 상단 오른쪽 커브 영역
        let p1 = CGPoint(x: rect.width - curveRadius, y: 0)
        let p2 = CGPoint(x: p1.x + 20, y: p1.y + 20)
        let p3 = CGPoint(x: p2.x, y: p2.y + 10)
        let p4 = CGPoint(x: p3.x + 50, y: p3.y + 30)
        let p5 = CGPoint(x: p4.x + 20, y: p4.y)
        let p6 = CGPoint(x: p5.x + 30, y: p5.y + 20)
        
        path.addLine(to: p1)
        path.addQuadCurve(to: p2, control: CGPoint(x: p2.x, y: p1.y))
        path.addLine(to: p3)
        path.addQuadCurve(to: p4, control: CGPoint(x: p3.x, y: p4.y))
        path.addLine(to: p5)
        path.addQuadCurve(to: p6, control: CGPoint(x: p6.x, y: p5.y))
        
        // 우측 하단 곡선
        path.addLine(to: CGPoint(x: rect.width, y: rect.height - cornerRadius))
        path.addQuadCurve(
            to: CGPoint(x: rect.width - cornerRadius, y: rect.height),
            control: CGPoint(x: rect.width, y: rect.height)
        )
        
        // 하단 선 연결
        path.addLine(to: CGPoint(x: cornerRadius, y: rect.height))
        path.closeSubpath()
        return path
    }
}

struct CardBackground: View {
    var desiredColor: Color
    
    var body: some View {
        MainCardShape()
            .fill(
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: desiredColor, location: 0.0),
                        .init(color: desiredColor, location: 0.76),
                        
                        .init(color: Color.white, location: 0.76),
                        .init(color: Color.white, location: 1.0)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(height: 240)
    }
}

