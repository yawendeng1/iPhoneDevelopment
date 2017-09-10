//
//  ViewController.swift
//  GraphingCalculator
//
//  Created by 邓雅文 on 9/9/17.
//  Copyright © 2017 Yawen Deng. All rights reserved.
//

import UIKit
import JavaScriptCore

class ViewController: UIViewController, UITextFieldDelegate, FunctionPlottingViewDelegate {

    @IBOutlet weak var exprTextField: UITextField!
    @IBOutlet weak var plotView: FunctionPlottingView!
    
    var crosshairLoc : CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exprTextField.delegate = self
        plotView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("called return")
        exprTextField.resignFirstResponder() // <- dismisses the keyboard
        plotView.setNeedsDisplay()
        return false
    }

    func getFunctionToPlot() -> ((Double) -> Double)? {
        let expr = exprTextField.text
        if expr == "" {
            return nil
        }
        
        let jsSrc = "sin = Math.sin; cos = Math.cos; f = function(x) {return \( expr! ); }"
        let jsCtx = JSContext()!
        jsCtx.evaluateScript(jsSrc)
        
        guard let f = jsCtx.objectForKeyedSubscript("f") else {
            return nil
        }
        if f.isUndefined {
            return nil
        }
        
        return {(x: Double) in return f.call(withArguments: [x])!.toDouble() }

    }
    
    func getCrossHairLocation() -> CGPoint? {
        return nil
    }

    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        crosshairLoc = sender.location(in: plotView)
        plotView.setNeedsDisplay()
    }
}

