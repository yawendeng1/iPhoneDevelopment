//
//  ViewController.swift
//  Calculator
//
//  Created by Yawen Deng on 8/26/17.
//  Copyright © 2017 Yawen Deng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    var firstNumberText = ""
    var secondNumberText = ""
    var op = ""
    var isFirstNumber = true
    var hasDot = false
    var lastOpButton = UIButton()
    var isOnFirst = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        super.viewDidLoad()
        resultsLabel.text = "0"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// change later: 00 -> 0, ... -> .
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        let currentText = (resultsLabel.text == "0") ? "" : resultsLabel.text!
        let textLabel = sender.titleLabel?.text
        lastOpButton.layer.borderWidth = 0
        if let text = textLabel {
            switch text {
                case "AC":
                    resultsLabel.text = "0"
                    isFirstNumber = true
                    hasDot = false
                    firstNumberText = ""
                    secondNumberText = ""
                    op = ""
                    break
                case "+", "*", "/", "-":
                    sender.layer.borderWidth = 5
                    lastOpButton = sender
                    if (currentText == "") {
                        return
                    }
                    if (isOnFirst == false && secondNumberText != "") {
                        if ((Double(secondNumberText)! == 0 && op == "/") || firstNumberText == "Error"){
                            resultsLabel.text = "Error"
                            firstNumberText = "Error"
                        } else {
                            let result = calculate()
                            resultsLabel.text = "\(result)"
                            firstNumberText = "\(result)"
                        }
                    }
                    secondNumberText = ""
                    op = text
                    isFirstNumber = false
                    hasDot = false
//                    resultsLabel.text = "\(currentText) \(op)"
                    break
                case "+/-":
                    if (currentText == "Error") {
                        return
                    }
                    if (isOnFirst == false) {
                        if (secondNumberText[secondNumberText.startIndex] != "-") {
                            secondNumberText.insert("-", at: secondNumberText.startIndex)
                        } else {
                            let index = secondNumberText.index(secondNumberText.startIndex, offsetBy: 1)
                            secondNumberText = secondNumberText.substring(from: index)
                        }
                        resultsLabel.text = "\(secondNumberText)"
                    } else if (firstNumberText != "") {
                        if (firstNumberText[firstNumberText.startIndex] != "-") {
                            firstNumberText.insert("-", at: firstNumberText.startIndex)
                        } else {
                            let index = firstNumberText.index(firstNumberText.startIndex, offsetBy: 1)
                            firstNumberText = firstNumberText.substring(from: index)
                        }
                        resultsLabel.text = "\(firstNumberText)"
                    }
                    break
                case "=":
                    if (secondNumberText == "") {
                        return
                    }
                    if ((Double(secondNumberText)! == 0 && op == "/") ||
                        firstNumberText == "Error"){
                        resultsLabel.text = "Error"
                        firstNumberText = "Error"
                    } else {
                        let result = calculate()
                        resultsLabel.text = "\(result)"
                        firstNumberText = "\(result)"
                        isOnFirst = true
                    }
                    break
                case "%":
                    if (currentText != "" && currentText != "Error") {
                        var temp = Double(currentText)!
                        temp = temp/100
                        resultsLabel.text = "\(currentText)"
                        if (isOnFirst) {
                            firstNumberText = String(temp)
                            resultsLabel.text = firstNumberText
                        } else {
                            secondNumberText = String(temp)
                            resultsLabel.text = secondNumberText
                        }
                    }
                    
//                    if (secondNumberText != "") {
//                        var temp = Double(secondNumberText)!
//                        temp = temp/100
//                        secondNumberText = String(temp)
//                        resultsLabel.text = "\(secondNumberText)"
//                    } else if (firstNumberText != ""){
//                        var temp = Double(firstNumberText)!
//                        temp = temp/100
//                        firstNumberText = String(temp)
//                        resultsLabel.text = "\(firstNumberText)"
//                    }
                    break
            default:
                if (text == ".") {
                    if (hasDot) {
                        return
                    } else {
                        hasDot = true
                    }
                }
                if isFirstNumber {
                    firstNumberText = "\(firstNumberText)\(text)"
                    resultsLabel.text = "\(firstNumberText)"
                    isOnFirst = true
                } else {
                    secondNumberText = "\(secondNumberText)\(text)"
                    resultsLabel.text = "\(secondNumberText)"
                    isOnFirst = false
                }
//                resultsLabel.text = "\(currentText)\(text)"
            }
        }
    }
    
    func calculate() -> Double {
        let firstNumber = Double(firstNumberText)!
        let secondNumber = Double(secondNumberText)!
        switch op {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "*":
            return firstNumber * secondNumber
        case "/":
            return firstNumber / secondNumber
        default:
            return 0
        }
    }
}

