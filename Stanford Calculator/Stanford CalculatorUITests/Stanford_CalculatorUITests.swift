//
//  Stanford_CalculatorUITests.swift
//  Stanford CalculatorUITests
//
//  Created by Diogo M Souza on 2017/06/22.
//  Copyright © 2017 Diogo M Souza. All rights reserved.
//

import XCTest

class Stanford_CalculatorUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
    }
    
//    func testExample() {
//        let app = XCUIApplication()
    
//        let buttonDigit1 = app.buttons["1"]
        
//        let buttonDigit2 = app.buttons["2"]
//        let buttonDigit3 = app.buttons["3"]
//        let buttonDigit4 = app.buttons["4"]
//        let buttonDigit5 = app.buttons["5"]
//        let buttonDigit6 = app.buttons["6"]
//        let buttonDigit7 = app.buttons["7"]
//        let buttonDigit8 = app.buttons["8"]
//        let buttonDigit9 = app.buttons["9"]
//        let buttonDigit0 = app.buttons["0"]
//
//        let buttonDecimalPoint = app.buttons["."]
//
//        let buttonPi = app.buttons["π"]
//
//        let buttonMultiply = app.buttons["×"]
//        let buttonDivide = app.buttons["÷"]
//        let buttonAdd = app.buttons["+"]
//        let buttonSubtract = app.buttons["−"]
//        let buttonCos = app.buttons["cos"]
//        let buttonSqrt = app.buttons["√"]
//
//        let buttonEqual = app.buttons["="]
//
//        // cos(π) = -1
//        buttonPi.tap()
//        buttonCos.tap()
//        XCTAssert(app.staticTexts["-1"].exists)
//    }
    
}
