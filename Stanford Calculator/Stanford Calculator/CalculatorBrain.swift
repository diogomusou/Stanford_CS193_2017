//
//  CalculatorBrain.swift
//  Stanford Calculator
//
//  Created by Diogo M Souza on 2017/05/31.
//  Copyright © 2017 Diogo M Souza. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    private var accumulator : (value : Double?, description : String?)
    private var resultIsPending = false
    private var description = ""
    
    private enum Operation {
        case constant(Double, String)
        case unaryOperation((Double) -> Double, (String) -> String)
        case binaryOperation(((Double,Double) -> Double))
        case equals
    }
    
    private var operations: Dictionary<String,Operation> = [
        "π" : Operation.constant(Double.pi, "π"),
        "e" : Operation.constant(M_E, "e"),
        "√" : Operation.unaryOperation(sqrt, {"√(\($0))"}),
        "±" : Operation.unaryOperation({-$0}, {"(-\($0))"}),
        "1/x":Operation.unaryOperation({1/$0}, {"1/\($0)"}),
        "cos":Operation.unaryOperation(cos, {"cos(\($0))"}),
        "sin":Operation.unaryOperation(sin, {"sin(\($0))"}),
        "tan":Operation.unaryOperation(tan, {"tan(\($0))"}),
        "x!": Operation.unaryOperation(factorial, {"!\($0)"}),
        "+" : Operation.binaryOperation(+),
        "−" : Operation.binaryOperation(-),
        "×" : Operation.binaryOperation(*),
        "÷" : Operation.binaryOperation(/),
        "=" : Operation.equals
    ]
    
    
    
    mutating func performOperation(_ symbol : String) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let (value, description)):
                accumulator.value = value
                if accumulator.description != nil {
                    accumulator.description = "\(accumulator.description!) \(description)"
                } else {
                    accumulator.description = description
                }
            case .unaryOperation(let (function, description)):
                if accumulator.value != nil {
                    //self.description += description(accumulator!)
                    accumulator = (function(accumulator.value!), description(accumulator.description!))
                }
            case .binaryOperation(let function):
                //if user wants to do multiple operations without pressing "=",
                //calculate previous result first (first 3 lines are same code as "case .equals"):
                if accumulator.value != nil && pendingBinaryOperation != nil {
                    //description += "\(symbol) "
                    accumulator = (pendingBinaryOperation!.perform(with: accumulator.value!),  "\(accumulator.description!) \(accumulator.value!)")
                    pendingBinaryOperation = nil
                    pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator.value!)
                    accumulator.value = nil
                    resultIsPending = true
                } else if accumulator.value != nil {
                    
                    //self.description = "\(accumulator.description!) \(symbol)"
                    pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator.value!)
                    accumulator = (nil, "\(accumulator.description!) \(symbol)")
                    resultIsPending = true
                }
            case .equals:
                if accumulator.value != nil && pendingBinaryOperation != nil {
                    //self.description += " \(accumulator!)"
                    accumulator = (pendingBinaryOperation!.perform(with: accumulator.value!),  "\(accumulator.description!) \(accumulator.value!)")
                    pendingBinaryOperation = nil
                    resultIsPending = false
                }
            }
        }
        if accumulator.description != nil {
            print(accumulator.description!)
        }
    }
    
    private var pendingBinaryOperation : PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        let function : (Double,Double) -> Double
        let firstOperand : Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    var result : Double? {
        get {
            return accumulator.value
        }
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator.value = operand
        if !resultIsPending {
            accumulator.description = "\(operand)"
        }
    }
    
    
}

func factorial(_ number: Double) -> Double {
    var result = 1.0
    var x = number
    while (x > 0) {
        result = result * x
        x = x - 1
    }
    return result
}
