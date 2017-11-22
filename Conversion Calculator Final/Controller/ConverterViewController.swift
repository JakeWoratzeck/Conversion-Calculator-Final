//
//  ConverterViewController.swift
//  Conversion Calculator UI
//
//  Created by Jake Woratzeck on 11/4/17.
//  Copyright © 2017 Jake Woratzeck. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    let model = ConverterModel()

    //Create ibactions for the buttons when pressed, each time pressed call conversion function from model and live update the view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        outputDisplay.text = model.convertersArray[0].outputUnit
        inputDisplay.text = model.convertersArray[0].inputUnit
    
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func converterTap(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alert.addAction(UIAlertAction(title: model.convertersArray[0].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice A
            self.model.converterState = 0
            self.updateFromConverterButton()
            //self.inputDisplay.text = self.model.convertersArray[0].inputUnit
            //self.outputDisplay.text = self.model.convertersArray[0].outputUnit
            
        }))
        alert.addAction(UIAlertAction(title: self.model.convertersArray[1].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice B
            self.model.converterState = 1
            self.updateFromConverterButton()
           // self.inputDisplay.text = self.model.convertersArray[1].inputUnit
         //   self.outputDisplay.text = self.model.convertersArray[1].outputUnit
            
        }))
        alert.addAction(UIAlertAction(title: self.model.convertersArray[2].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice C
            self.model.converterState = 2
            self.updateFromConverterButton()
          //  self.inputDisplay.text = self.model.convertersArray[2].inputUnit
          //  self.outputDisplay.text = self.model.convertersArray[2].outputUnit
            
        }))
        alert.addAction(UIAlertAction(title: self.model.convertersArray[3].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice D
            self.model.converterState = 3
            self.updateFromConverterButton()
            //self.inputDisplay.text = self.model.convertersArray[3].inputUnit
           // self.outputDisplay.text = self.model.convertersArray[3].outputUnit
            
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func numberButtonTap(_ sender: UIButton) {
        //pass button pressed to update? probably
        updateDisplayFromNumberButton(sender.titleLabel!.text!)
    }
    
    //Appends number or dot user selects, calls conversion function, and adds label to end
    func updateDisplayFromNumberButton (_ input: String) {
        if(input == "." && model.stringHasDotAlready == true) {
            //if trying to input multiple periods the function will escape
            return
        }
        if(input == "." && model.stringHasDotAlready == false){
            model.stringHasDotAlready = true
        }
        
        //Takes the current string from inputDisplay, removes label and space
        var inputDisplayString = removeLabelFromInputDisplayString()
        inputDisplayString = inputDisplayString + input
        let inputDouble = Double(inputDisplayString)
        inputDisplayString = inputDisplayString + model.convertersArray[model.converterState].inputUnit
        
        if(inputDisplayString.hasPrefix(". ")){
           //If first button clicked is a . this prevents it from converting
            inputDisplay.text = inputDisplayString
            outputDisplay.text = input + model.convertersArray[model.converterState].outputUnit
        }
        else{
            inputDisplay.text = inputDisplayString
            outputDisplay.text = model.convertValue(inputDouble!) + model.convertersArray[model.converterState].outputUnit
        }
        
        
    }
    
    func updateFromConverterButton (){
        
        let inputDisplayString = removeLabelFromInputDisplayString()
        let inputDouble = Double(inputDisplayString)
            
        inputDisplay.text = inputDisplayString + model.convertersArray[model.converterState].inputUnit
        
        //Prevents converting a string with no numbers in it
        if (inputDisplayString != ""){
            if (inputDisplayString != "." && inputDisplayString != "-."){
                outputDisplay.text = model.convertValue(inputDouble!) + model.convertersArray[model.converterState].outputUnit
            }
            else {
                outputDisplay.text = inputDisplayString + model.convertersArray[model.converterState].outputUnit
            }
        }
        else {
            outputDisplay.text = model.convertersArray[model.converterState].outputUnit
        }

    }
    
    @IBAction func signButtonPress(_ sender: Any) {
        var inputString = inputDisplay.text
        if(inputString!.hasPrefix(" ")) {
            //If there is no numbers in the inputDisplay yet, escape function or it will crash
            return
        }
        else{
            if(inputString!.hasPrefix("-")){
                inputString!.remove(at: inputString!.startIndex)
                inputDisplay.text = inputString!
                inputString = self.removeLabelFromInputDisplayString()
                if(inputString != "."){
                    let inputDouble = Double(inputString!)
                    outputDisplay.text = model.convertValue(inputDouble!) + model.convertersArray[model.converterState].outputUnit
                }
                else {
                    outputDisplay.text = inputString! + model.convertersArray[model.converterState].outputUnit
                }
                
            }
            else {
                inputString!.insert("-", at: inputString!.startIndex)
                inputDisplay.text = inputString!
                inputString = self.removeLabelFromInputDisplayString()
                if(inputString != "-.") {
                    let inputDouble = Double(inputString!)
                    outputDisplay.text = model.convertValue(inputDouble!) + model.convertersArray[model.converterState].outputUnit
                }
                else {
                    outputDisplay.text = inputString! + model.convertersArray[model.converterState].outputUnit
                }
               
            }
        }
    }
    
    
    func removeLabelFromInputDisplayString() -> String {
        var inputDisplayString = inputDisplay.text
        let inputLabel = (inputDisplayString!.index(inputDisplayString!.endIndex, offsetBy: -3))..<inputDisplayString!.endIndex
        inputDisplayString!.removeSubrange(inputLabel)
        
        return inputDisplayString!
    }
    
    @IBAction func clearButtonPress(_ sender: UIButton) {
        inputDisplay.text = model.convertersArray[model.converterState].inputUnit
        outputDisplay.text = model.convertersArray[model.converterState].outputUnit
        
        model.stringHasDotAlready = false
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
