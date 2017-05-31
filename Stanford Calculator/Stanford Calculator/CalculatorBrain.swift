//
//  CalculatorBrain.swift
//  Stanford Calculator
//
//  Created by Diogo M Souza on 2017/05/31.
//  Copyright © 2017 Diogo M Souza. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    private var accumulator : Double? = nil
    
    enum Operation {
        
    }
    
    func performOperation(_ symbol : String) -> Double {
        switch symbol {
        case "π":
            return Double.pi
        case "√":
            return sqrt(9)
        default:
            return 4.0
        }
    }
    
    var operand : Double? {
        get {
            if let result = accumulator {
                return result
            }
            return nil
        }
    }
    
}
