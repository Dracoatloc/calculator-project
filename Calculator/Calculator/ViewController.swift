//
//  ViewController.swift
//  Calculator
//
//  Created by user192468 on 2/23/21.
//

import UIKit

class ViewController: UIViewController {

    //var previousNumber: Int = 0;
    var previousNumber: Int = 0;
    var operatorIdentifier: Int = 1;
    var operationReset: Int = 0;
    var operationResult: Int = 0;
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func processNumber(_ sender: UIButton) {
        if let numberText = sender.titleLabel?.text {
            if(displayLabel.text == "0") {
                displayLabel.text = numberText
            } else {
                if(operationReset == 1)
                {
                    displayLabel.text = numberText
                    operationReset = 0
                } else {
                    displayLabel.text = displayLabel.text! + numberText
                    operationReset = 0
                }
                
            }
        }
    }
	
    @IBAction func processOperator(_ sender: UIButton) {
        
        previousNumber = Int(displayLabel.text!)!
        if(operatorIdentifier == 1)
        {
            operationResult = operationResult + previousNumber //+ Int(displayLabel.text!)!
        }
        if let operatorText = sender.titleLabel?.text {
            
            
            if(sender.titleLabel?.text == "+") {
                
                operatorIdentifier = 1
                operationReset = 1
            } else if (operatorText == "=") {
                
                displayLabel.text = String(operationResult)
                operatorIdentifier = 0
                operationReset = 1
            }
        }
    }
}

