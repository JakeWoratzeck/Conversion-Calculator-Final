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
    
    
    
    var convertersArray: Array<Converter>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let converters = [Converter(label: "fahrenheit to celsius", inputUnit: "°F", outputUnit: "°C"),
                               Converter(label: "celsius to fahrenheit", inputUnit: "°C", outputUnit: "°F"),
                               Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
                               Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]
        
        //Allows array to be used in converterTap
        convertersArray = converters
        
        //Array Indexes
        //0 = fahrenheit to celsius
        //1 = celsius to fahrenheit
        //2 = miles to kilometers
        //3 = kilometers to miles
        
        //Set default
        outputDisplay.text = convertersArray![0].outputUnit
        inputDisplay.text = convertersArray![0].inputUnit
    
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func converterTap(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alert.addAction(UIAlertAction(title: convertersArray![0].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice A
            self.inputDisplay.text = self.convertersArray![0].inputUnit
            self.outputDisplay.text = self.convertersArray![0].outputUnit
            
        }))
        alert.addAction(UIAlertAction(title: convertersArray![1].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice B
            self.inputDisplay.text = self.convertersArray![1].inputUnit
            self.outputDisplay.text = self.convertersArray![1].outputUnit
            
        }))
        alert.addAction(UIAlertAction(title: convertersArray![2].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice C
            self.inputDisplay.text = self.convertersArray![2].inputUnit
            self.outputDisplay.text = self.convertersArray![2].outputUnit
            
        }))
        alert.addAction(UIAlertAction(title: convertersArray![3].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice D
            self.inputDisplay.text = self.convertersArray![3].inputUnit
            self.outputDisplay.text = self.convertersArray![3].outputUnit
            
        }))
        self.present(alert, animated: true, completion: nil)
        
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
