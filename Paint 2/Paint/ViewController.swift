//
//  ViewController.swift
//  Paint
//
//  Created by Linara Ualiyeva on 2/16/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchtoFill: UISwitch!
    @IBOutlet weak var customView: CustomView!
    @IBOutlet weak var undoLast: UIButton!
    @IBAction func buttonTouched(_ sender: UIButton) {
        customView.identifier = sender.currentTitle!
    }
    
    
    @IBAction func changeFill(_ sender: UISwitch) {
        if(switchtoFill.isOn){
            customView.isFill = switchtoFill.isOn
        } else{
            customView.isFill = switchtoFill.isOn
        }
    }
    @IBAction func colorPicker(_ sender: UIButton) {
        customView.color_name = sender.currentTitle!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.vc = self
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGest))
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap))
        undoLast.addGestureRecognizer(gesture)
        undoLast.addGestureRecognizer(longGesture)
        // Do any additional setup after loading the view.
    }
    @objc func tapGest( ){
        if !customView.lines.isEmpty{
            customView.lines.removeLast()
            customView.setNeedsDisplay()
        }
    }
    
    @objc func longTap(){
        if !customView.lines.isEmpty{
            customView.lines.removeAll()
            customView.setNeedsDisplay()
        }
    }


}

