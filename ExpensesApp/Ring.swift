//
//  Ring.swift
//  ExpensesApp
//  Created by Aleksey Alyonin on 09.05.2022.
//

import SwiftUI

struct Ring: View {
    var lineWidth: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color
    var percentage: Double
    var sumInCenter: Int
    var animationDuration: Double
    
    var body: some View{
        GeometryReader {geometry in
            ZStack{
//                track
                RingShape()
                    .stroke(style: StrokeStyle(lineWidth:lineWidth ))
                    .fill(backgroundColor)
                Text("\(sumInCenter)")
                    .font(.title2).bold()
                    .foregroundColor(.black).opacity(0.7)
//                animated ring
                RingShape(percent: percentage)
                    .stroke(style: StrokeStyle(lineWidth:lineWidth, lineCap: .round))
                    .fill(foregroundColor)
              
            }
            .animation(.easeIn(duration: animationDuration))
            .padding(lineWidth / 2)
        }
        
    }
}

struct Ring2: View {
    var lineWidth: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color
    var percentage: Double
    var animationDuration: Double
    
    var body: some View{
        GeometryReader {geometry in
            ZStack{
//                track
                RingShape()
                    .stroke(style: StrokeStyle(lineWidth:lineWidth ))
                    .fill(backgroundColor)

//                animated ring
                RingShape(percent: percentage)
                    .stroke(style: StrokeStyle(lineWidth:lineWidth, lineCap: .round))
                    .fill(foregroundColor)
              
            }
            .animation(.easeIn(duration: animationDuration))
            .padding(lineWidth / 2)
        }
        
    }
}
