//
//  ContentView.swift
//  Conversions
//
//  Created by 张熙景 on 3/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var temperature = ""
    @State private var temperatureInput = 25.0
    @State private var temperatureOutput = 0.0
    @State private var temperatureSelect = 0
    @State private var temperatureDesired = 1
    let temperatureArray = ["Celsius", "Fahrenheit", "Kelvin"]
    
    @State private var length = ""
    @State private var lengthInput = 1000.0
    @State private var lengthOutput = 0.0
    @State private var lengthSelect = 0
    @State private var lengthDesired = 1
    let lengthArray = ["Meters", "Kilos", "Feet", "Yards", "Miles"]
    
    @FocusState private var amountIsFocused: Bool
    
    var temperatureOutputValue: Double {
        if (temperatureSelect == 0) {
            if (temperatureDesired == 0) {
                let ouputValue = temperatureInput
                return ouputValue
            } else if (temperatureDesired == 1) {
                let ouputValue = Double(temperatureInput * 9 / 5) + 32
                return ouputValue
            } else {
                let ouputValue = Double(temperatureInput) + 273.15
                return ouputValue
            }
        } else if (temperatureSelect == 1) {
            if (temperatureDesired == 0) {
                let ouputValue = (Double(temperatureInput) - 32) * 5 / 9
                return ouputValue
            } else if (temperatureDesired == 1) {
                let ouputValue = temperatureInput
                return ouputValue
            } else {
                let ouputValue = (Double(temperatureInput) - 32) * 5 / 9 + 273.15
                return ouputValue
            }
        } else if (temperatureSelect == 2) {
            if (temperatureDesired == 0) {
                let ouputValue = Double(temperatureInput) - 273.15
                return ouputValue
            } else if (temperatureDesired == 1) {
                let ouputValue = (Double(temperatureInput) - 273.15) * 9 / 5 + 32
                return ouputValue
            } else {
                let ouputValue = temperatureInput
                return ouputValue
            }
        } else {
            return 0
        }
    }
    
    var lengthOutputValue: Double {
        if (lengthSelect == 0) {
            if (lengthDesired == 0) {
                let ouputValue = lengthInput
                return ouputValue
            } else if (lengthDesired == 1) {
                let ouputValue = Double(lengthInput) / 1000
                return ouputValue
            } else if (lengthDesired == 2) {
                let ouputValue = Double(lengthInput) * 3.281
                return ouputValue
            } else if (lengthDesired == 3) {
                let ouputValue = Double(lengthInput) * 1.094
                return ouputValue
            } else {
                let ouputValue = Double(lengthInput) / 1609
                return ouputValue
            }
        } else if (lengthSelect == 1) {
            if (lengthDesired == 0) {
                let ouputValue = Double(lengthInput) * 1000
                return ouputValue
            } else if (lengthDesired == 1) {
                let ouputValue = lengthInput
                return ouputValue
            } else if (lengthDesired == 2) {
                let ouputValue = Double(lengthInput) * 3281
                return ouputValue
            } else if (lengthDesired == 3) {
                let ouputValue = Double(lengthInput) * 1094
                return ouputValue
            } else {
                let ouputValue = Double(lengthInput) / 1.609
                return ouputValue
            }
        } else if (lengthSelect == 2) {
            if (lengthDesired == 0) {
                let ouputValue = Double(lengthInput) / 3.281
                return ouputValue
            } else if (lengthDesired == 1) {
                let ouputValue = Double(lengthInput) / 3281
                return ouputValue
            } else if (lengthDesired == 2) {
                let ouputValue = lengthInput
                return ouputValue
            } else if (lengthDesired == 3) {
                let ouputValue = Double(lengthInput) / 3
                return ouputValue
            } else {
                let ouputValue = Double(lengthInput) / 5280
                return ouputValue
            }
        } else if (lengthSelect == 3) {
            if (lengthDesired == 0) {
                let ouputValue = Double(lengthInput) / 1.094
                return ouputValue
            } else if (lengthDesired == 1) {
                let ouputValue = Double(lengthInput) / 1094
                return ouputValue
            } else if (lengthDesired == 2) {
                let ouputValue = Double(lengthInput) * 3
                return ouputValue
            } else if (lengthDesired == 3) {
                let ouputValue = lengthInput
                return ouputValue
            } else {
                let ouputValue = Double(lengthInput) / 1760
                return ouputValue
            }
        } else if (lengthSelect == 4) {
            if (lengthDesired == 0) {
                let ouputValue = Double(lengthInput) * 1609
                return ouputValue
            } else if (lengthDesired == 1) {
                let ouputValue = Double(lengthInput) * 1.609
                return ouputValue
            } else if (lengthDesired == 2) {
                let ouputValue = Double(lengthInput) * 5280
                return ouputValue
            } else if (lengthDesired == 3) {
                let ouputValue = Double(lengthInput) * 1760
                return ouputValue
            } else {
                let ouputValue = lengthInput
                return ouputValue
            }
        } else {
            return 0
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Input value", value: $temperatureInput, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Temperature Type", selection: $temperatureSelect) {
                        ForEach(0..<3) {
                            Text("\(self.temperatureArray[$0])")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Picker("Temperature Type", selection: $temperatureDesired) {
                        ForEach(0..<3) {
                            Text("\(self.temperatureArray[$0])")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text(temperatureOutputValue, format: .number)
                } header: {
                    Text("Temperature conversion")
                        .font(.headline)
                }
                
                Section {
                    TextField("Input value", value: $lengthInput, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Length Type", selection: $lengthSelect) {
                        ForEach(0..<5) {
                            Text("\(self.lengthArray[$0])")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Picker("Length Type", selection: $lengthDesired) {
                        ForEach(0..<5) {
                            Text("\(self.lengthArray[$0])")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text(lengthOutputValue, format: .number)
                } header: {
                    Text("Length conversion")
                        .font(.headline)
                }
            }
            .navigationTitle("Unit conversions")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
