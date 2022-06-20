//
//  RingShape.swift
//  ExpensesApp
//
//  Created by Aleksey Alyonin on 09.05.2022.
//

import Foundation
import SwiftUI

struct RingShape: Shape {
    
    var percent: Double
    var startAngel: Double
    typealias AnimatableData = Double
    
    var animatableData: Double {
        get {
            return percent
        }
        set {
            percent = newValue
        }
    }
    
    init(
        percent: Double = 100,
        startAngel: Double = -90){
            self.percent = percent
            self.startAngel = startAngel
        }
    static func percentToAngel(percent: Double, startAngel: Double) -> Double {
        return (percent / 100 * 360) + startAngel
    }
    
    func path(in rect: CGRect) -> Path {
        
        let width = rect.width
        let hight = rect.height
        let radius = min(hight, width) / 2
        let center = CGPoint(x: width / 2, y: hight / 2)
        let endAngle = Self.percentToAngel(percent: percent, startAngel: startAngel)
        
        return Path {path in
            path.addArc(center: center,
                        radius: radius,
                        startAngle: Angle(degrees: startAngel),
                        endAngle: Angle(degrees: endAngle),
                        clockwise: false)
        }
    }
}
