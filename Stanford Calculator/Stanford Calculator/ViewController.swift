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
    var userIsTypingDoubleValue = false  //flag to avoid numbers with 2 or more dots "."
    
    private var brain = CalculatorBrain()
    
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
    
    //Action for when "." is pressed. 
    //User most be currently typing a number, and "." can only be inserted once per number
    @IBAction func touchedDot(_ sender: UIButton) {
        let dot = sender.currentTitle!
        if !userIsTypingDoubleValue && userIsInTheMiddleOfTyping{
            let textCurrentlyInDisplay = displayLabel.text!
            displayLabel.text = textCurrentlyInDisplay + dot
            userIsTypingDoubleValue = true
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
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
            userIsTypingDoubleValue = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result {
            displayValue = result
        }
    }

    //Reset brain (by reinitializing the CalculatorBrain
    //and clear the display label
    @IBAction func touchedAC(_ sender: UIButton) {
        brain = CalculatorBrain()
        displayLabel.text = "0"
    }

}

