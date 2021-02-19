//
//  Pencil.swift
//  Paint
//
//  Created by Linara Ualiyeva on 2/18/21.
//

import Foundation
import UIKit
class Pen {
    var points: [CGPoint]
    var color: UIColor
    var strokeWidth: CGFloat = 0.0
    
    init(points: [CGPoint], color: UIColor, strokeWidth: CGFloat) {
        self.points = points
        self.color = color
        self.strokeWidth = strokeWidth
    }

}
