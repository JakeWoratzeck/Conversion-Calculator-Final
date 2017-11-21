//
//  Converter.swift
//  Conversion Calculator UI
//
//  Created by Jake Woratzeck on 11/4/17.
//  Copyright © 2017 Jake Woratzeck. All rights reserved.
//

import Foundation

struct Converter {
    let label: String
    let inputUnit: String
    let outputUnit: String
    
    init(label: String, inputUnit: String, outputUnit: String){
        self.label = label
        self.inputUnit = inputUnit
        self.outputUnit = outputUnit
    }
}
