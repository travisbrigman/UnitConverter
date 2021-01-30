//
//  ContentView.swift
//  UnitConverter
//
//  Created by Travis Brigman on 1/29/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userValue = ""
    @State private var inputUnit = 1
    @State private var outputUnit = 1
    
    let unitNames: [UnitLength] = [.astronomicalUnits,.centimeters,.decameters,.decimeters,.fathoms,.furlongs,.hectometers,.kilometers,.lightyears,.megameters,.meters,.meters,.miles,.millimeters,.scandinavianMiles,.inches, .feet]
    
    var answer: Double {
        let valueToConvert = Measurement(value: Double(userValue) ?? 0, unit: unitNames[inputUnit])
        
        return valueToConvert.converted(to: unitNames[outputUnit]).value
    }
    
    var body: some View {
        
        NavigationView{
            Form{
                Section{
                    TextField("value", text: $userValue)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("pick a source unit")){
                    Picker("Unit", selection: $inputUnit) {
                        
                        ForEach(0 ..< unitNames.count) {
                            Text("\(self.unitNames[$0].symbol)")
                        }
                    }
                }
                Section(header: Text("pick a destination unit")){
                    Picker("Unit", selection: $outputUnit) {
                        
                        ForEach(0 ..< unitNames.count) {
                            Text("\(self.unitNames[$0].symbol)")
                        }
                    }
                }
                Text("\(answer, specifier: "%.4g")")
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
