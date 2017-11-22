//
//  ConverterModel.swift
//  Conversion Calculator UI
//
//  Created by Jake Woratzeck on 11/21/17.
//  Copyright © 2017 Jake Woratzeck. All rights reserved.
//

import Foundation

class ConverterModel {
    
    //default converter state is  fahrenheit to celsius, changes when convert button is tapped and an option is selected
    var converterState = 0
    //prevents multiple periods in a number
    var stringHasDotAlready = false
    
    let convertersArray: Array<Converter> = [Converter(label: "fahrenheit to celsius", inputUnit: " °F", outputUnit: " °C"), //0
                                             Converter(label: "celsius to fahrenheit", inputUnit: " °C", outputUnit: " °F"), //1
                                             Converter(label: "miles to kilometers", inputUnit: " mi", outputUnit: " km"), //2
                                             Converter(label: "kilometers to miles", inputUnit: " km", outputUnit: " mi")] //3
    
    func convertValue (_ input: Double) -> String {
        switch converterState {
            case 0:
                return String((input - 32) * 0.5556)
            case 1:
                return String((input * 1.8) + 32)
            case 2:
                return String(input * 1.6)
            case 3:
                return String(input / 1.6)
            default:
                return ""
        
        }
        
    }
    
    
}
