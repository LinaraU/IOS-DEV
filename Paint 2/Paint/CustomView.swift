//
//  CustomView.swift
//  Paint
//
//  Created by Linara Ualiyeva on 2/16/21.
//

import UIKit
protocol Drawable{
    func drawPath()
}
class CustomView: UIView {
    var isFill: Bool = false
    var pointOne: CGPoint?
    var pointTwo: CGPoint!
    var arrayOfFigures:[Drawable] = []
    var lines = [[CGPoint]]()
    var identifier: String?
    var color_picker: UIColor?
    var color_name: String?
    var vc: ViewController!
    struct Point {
        var center: CGPoint?
        var pointOne: CGPoint?
        var pointTwo: CGPoint!
        var shape: String
        var color: UIColor
        var isFilled: Bool
    }
    var points: [Point] = []
    
    
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
   
    */
    override func draw(_ rect: CGRect) {
        
        switch color_name{
            case"black"?:
                color_picker = .black
        case"yellow"?:
            color_picker = .yellow
        case"blue"?:
            color_picker = .blue
        case"brown"?:
            color_picker = .brown
        case"red"?:
            color_picker = .red
        case"green"?:
            color_picker = .green
        default:
            break
        }
        
        switch identifier{
        case"rectangle"?:
            let rect = Rectangle(p1: pointOne!, p2: pointTwo!, color: color_picker!, stroke_width: 4, isFilled: isFill)
            rect.drawPath()
//            arrayOfFigures.append(rect as! Drawable)
        case"triangle"?:
            let triangle = Triangle(p1: pointOne!, p2: pointTwo!, color: color_picker!, stroke_width: 4, isFilled: isFill)
//            arrayOfFigures.append(triangle as! Drawable)
            triangle.drawPath()
        case"line"?:
            let line = Line(p1: pointOne!, p2: pointTwo!, color: color_picker!, stroke_width: 4)
//            arrayOfFigures.append(line as! Drawable)
            line.drawPath()
        case"circle"?:
            print("circle")
            let circle = Circle(p1: pointOne!, p2: pointTwo!, color: color_picker!, stroke_width: 2, isFilled: isFill)
            circle.drawPath()
//            arrayOfFigures.append(circle as! Drawable)
        case "pen"?:
            guard let context = UIGraphicsGetCurrentContext() else { return}
            context.setStrokeColor(color_picker!.cgColor)
            context.setLineWidth(4)
            lines.forEach{ (line) in
                for(i,p) in line.enumerated(){
                    if i == 0{
                        context.move(to: p)
                    }else{
                        context.addLine(to: p)
                    }
                }
                
            }
            context.strokePath()
            
        default:
            break;
        }
        // Drawing code
       
            //let rect = Rectangle(p1: p1, p2: pointTwo, color: .green, stroke_width: 4, isFilled: false)
           // rect.drawPath()
            //let line = Line(p1: p1, p2: pointTwo, color: .red, stroke_width: 4)
           // line.drawPath()
           // let triangle = Triangle(p1: p1, p2: pointTwo, color: .blue, stroke_width: 4, isFilled: false)
           // triangle.drawPath()
            
            
        
        

        
    }
    
  //  func drawLine() {
     //       if let p1 = pointOne{
     //           let line = Line(point1: p1, point2: pointTwo, color: color, strokeWidth: 4)
     //           line.drawPath()
      //          points.append(Point(point1: p1, point2: pointTwo, shape: "Line", color:  color, isFilled: false))
    //        }
   //     }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard  let point = touches.first?.location(in: nil) else {return}
        guard var lastLine = lines.popLast() else {return}
        lastLine.append(point)
        lines.append(lastLine)
        setNeedsLayout()
        for figures in arrayOfFigures{
            figures.drawPath()
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            pointOne = touch.location(in: self)
        }
        lines.append([CGPoint]())
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            pointTwo = touch.location(in: self)
        }
        
        
        setNeedsDisplay()
    }
}
 
