//
//  Triangle.swift
//  Paint
//
//  Created by Linara Ualiyeva on 2/18/21.
//

import Foundation
import UIKit

class Triangle{
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
        let path = UIBezierPath()
        let start = CGPoint(x: p1.x, y: p1.y)
        let end = CGPoint(x: p2.x, y: p2.y)
        let middle = CGPoint(x: p1.x, y: p2.y)
        let back = CGPoint(x: p1.x, y: p1.y)
        
        path.move(to: start)
        path.addLine(to: end)
        path.addLine(to: middle)
        path.addLine(to: back)
        path.lineWidth = stroke_width
        color.set()
        (isFilled ? (path.fill()) : (path.stroke()))
    }
}

extension Double{
    var sg: CGFloat{
        return CGFloat(self)
    }
}

