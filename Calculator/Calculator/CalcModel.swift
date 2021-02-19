//
//  CalcModel.swift
//  Calculator
//
//  Created by Linara Ualiyeva on 1/31/21.
//

import Foundation
enum Operations{
    case constants(Double)
    case unaryOperation((Double)->Double)
    case binaryOperations((Double, Double)->Double)
    case equals
}
func percent(value1: Double)->Double{
    return value1/100
}
var istouched: Bool = false
struct CalculatorModel {
    var my_operations: Dictionary<String, Operations> = [
        "π": Operations.constants(Double.pi),
        "e": Operations.constants(M_E),
        "%": Operations.unaryOperation(percent),
        "+": Operations.binaryOperations({$0+$1}),
        "-": Operations.binaryOperations({$0-$1}),
        "÷": Operations.binaryOperations({$0/$1}),
        "x": Operations.binaryOperations({$0*$1}),
        "±": Operations.unaryOperation({-$0}),
        "=": Operations.equals
        
    ]
    private var global_value: Double?
    
    mutating func setOperant(_ operand: Double){
        global_value = operand
    }
    
mutating func performOperation(_ operation: String){
       let symbol = my_operations[operation]!
    switch symbol {
    case .constants(let value):
        global_value = value
        
    case .unaryOperation(let function):
        global_value = function(global_value!)
    case .binaryOperations(let function):
        if istouched{
            global_value = saving?.performOperationWith(secondOperand: global_value!)
        }
            istouched = true
            saving = saveFirstOperandAndOperation(firstOperand: global_value!, operation: function)

    case .equals:
        if istouched{
       global_value = saving?.performOperationWith(secondOperand: global_value!)
            
            istouched = false
            }
        }
    }
    
    private mutating func saveEquation(){
       
    }
    func getResult()->Double?{
        return global_value
    }
    private var saving: saveFirstOperandAndOperation?
    struct saveFirstOperandAndOperation{
        var firstOperand: Double
        var operation:(Double, Double)->Double
        
        func performOperationWith(secondOperand op2:Double)->Double{
            return operation(firstOperand, op2)
        }
    }
}
