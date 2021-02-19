//
//  Circle.swift
//  Paint
//
//  Created by Linara Ualiyeva on 2/16/21.
//

import Foundation
import UIKit
class Circle{
    private var p1: CGPoint
    private var p2: CGPoint
    private var color: UIColor
    private var stroke_width: CGFloat = 0.0
    private var isFilled: Bool
    
    init(p1: CGPoint, p2: CGPoint, color: UIColor, stroke_width: CGFloat, isFilled: Bool) {
        self.color = color
        self.isFilled = isFilled
        self.p1 = p1
        self.p2 = p2
        self.stroke_width = stroke_width
    }
    
    func drawPath(){
        
        let path = UIBezierPath(arcCenter: CGPoint(x: (p2.x - p1.x)/2 + p1.x, y: (p2.y - p1.y)/2 + p1.y),
                                       radius: min((((p2.x - p1.x)/2)), (((p2.y - p1.y)/2))),
                                       startAngle: 0,
                                       endAngle: CGFloat(2*Double.pi),    clockwise: true)

        path.lineWidth = stroke_width
        color.set()
                (isFilled) ? path.fill() : path.stroke()

    }
}
extension Double{
    var cg: CGFloat{
        return CGFloat(self)
    }
}
