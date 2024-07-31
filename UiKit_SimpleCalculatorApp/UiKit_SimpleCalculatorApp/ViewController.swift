//
//  ViewController.swift
//  UiKit_SimpleCalculatorApp
//
//  Created by michael on 30/07/2024.
//

import UIKit

class ViewController: UIViewController {
    var fulloperation : String = ""
    var rightPart:String = ""
    var liftPart : String = ""
    var operation :String = ""
    var result:Float = 0.0
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func digitPressed(_ sender: UIButton) {
        if(displayLabel.text == "0"){
            displayLabel.text = sender.currentTitle
            
            
        }else if(displayLabel.text == "/" || displayLabel.text == "*" || displayLabel.text == "+" || displayLabel.text == "-"){
            
            displayLabel.text  = ""
            displayLabel.text! += sender.currentTitle!
            liftPart = displayLabel.text!
            //print("this is lift part \(liftPart)")
        }else{
            displayLabel.text! += sender.currentTitle!
            liftPart = displayLabel.text!
            //print("this is lift part \(liftPart)")
        }
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        fulloperation = displayLabel.text!
        //print(Float(fulloperation))
        if let FrightPart = Float(fulloperation){
            rightPart = displayLabel.text!
            //print("this is Float right part\(FrightPart)")
            displayLabel.text! = sender.currentTitle!
            operation = displayLabel.text!
            //print("this is operation \(operation)")
        }else{
            //displayLabel.text! = String(getresultvalue())
            //rightPart = displayLabel.text!
            //print("this is right part\(rightPart)")
            displayLabel.text! = sender.currentTitle!
            operation = displayLabel.text!
            //print("this is operation \(operation)")
        }
        
    }
    
    
    
    @IBAction func clearPressed(_ sender: UIButton) {
        fulloperation = "0"
        displayLabel.text! = fulloperation
    }
    
    @IBAction func delPressed(_ sender: UIButton) {
        displayLabel.text! = String(displayLabel.text!.dropLast())
        
    }
    
    @IBAction func presentagePressed(_ sender: Any) {
        displayLabel.text! = String(Float(displayLabel.text!)!/100)
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        displayLabel.text! = String(getresultvalue())
        rightPart = ""
        liftPart = ""
        operation = ""
    }
    
    func getresultvalue()->Float{
        switch operation {
        case "+":
            result = Float(rightPart)! + Float(liftPart)!
        case "-":
            result = Float(rightPart)! - Float(liftPart)!
        case "*":
            result = Float(rightPart)! * Float(liftPart)!
        case "/":
            result = Float(rightPart)! / Float(liftPart)!
        default:
            break
        }
        return result
    }
}

