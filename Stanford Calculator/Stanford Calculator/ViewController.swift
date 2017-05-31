//
//  ViewController.swift
//  Stanford Calculator
//
//  Created by Diogo M Souza on 2017/05/31.
//  Copyright © 2017 Diogo M Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    let brain = CalculatorBrain()
    
    @IBAction func touchedDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = displayLabel.text!
            displayLabel.text = textCurrentlyInDisplay + digit
        } else {
            displayLabel.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    var displayValue : Double {
        get {
            return Double(displayLabel.text!)!
        }
        set {
            displayLabel.text = String(newValue)
        }
    }

    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            displayValue = brain.performOperation(mathematicalSymbol)
        }
    }


}

