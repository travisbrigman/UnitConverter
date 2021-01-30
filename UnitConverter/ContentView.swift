//
//  ContentView.swift
//  UnitConverter
//
//  Created by Travis Brigman on 1/29/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // declare state variables
    // this one has to be a string because its a user input
    @State private var userValue = ""
    //these are ultimately selecting positions on the array below
    @State private var inputUnit = 1
    @State private var outputUnit = 1
    
    //array of UnitLength instances
    let unitNames: [UnitLength] = [.astronomicalUnits,.centimeters,.decameters,.decimeters,.fathoms,.furlongs,.hectometers,.kilometers,.lightyears,.megameters,.meters,.meters,.miles,.millimeters,.scandinavianMiles,.inches, .feet]
    
    //computed property that caclucates the conversion
    var answer: Double {
        //Meausurement is a built-in struct from the standard library
        let valueToConvert = Measurement(value: Double(userValue) ?? 0, unit: unitNames[inputUnit])
        
        //now you just call the converted method on what we created above
        return valueToConvert.converted(to: unitNames[outputUnit]).value
    }
    
    var body: some View {
        //pretty standard view stuff
        NavigationView{
            Form{
                Section{
                    TextField("value", text: $userValue)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("pick a source unit")){
                    Picker("Unit", selection: $inputUnit) {
                        
                        ForEach(0 ..< unitNames.count) {
                            //the magic here is the .symbol that keeps you from creating a dictionary, array of tuples, etc. to get strings to describe the unit in the UI. symbol is a string property itself.
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
