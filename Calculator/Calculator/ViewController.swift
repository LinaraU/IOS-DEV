//
//  ViewController.swift
//  Calculator
//
//  Created by Linara Ualiyeva on 1/31/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myDisplay: UILabel!
    var typing: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func digitPressed(_ sender: UIButton) {
        let currentDigit = sender.currentTitle!
        if typing{
        let currentDisplay = myDisplay.text!
        myDisplay.text = currentDisplay + currentDigit
        } else{
            myDisplay.text = currentDigit
            typing = true
            }
        }
    var displayValue: Double{
        get{
            return Double(myDisplay.text!)! 
        }
        set{
            if (newValue == Double(Int(newValue))){
                myDisplay.text = String(Int(newValue))
            } else {
                myDisplay.text = String(newValue)
            }
        }
    }
    
    private var calculatorModel = CalculatorModel()
    @IBAction func operationPressed(_ sender: UIButton) {
        calculatorModel.setOperant(displayValue)
        calculatorModel.performOperation(sender.currentTitle!)
        displayValue = calculatorModel.getResult()!
        typing = false
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        clearText()
    }
    func clearText(){
        myDisplay.text = "0"
        typing = false
    }
}

