//
//  ContentView.swift
//  WeSplit
//
//  Created by Alonso Acosta Enriquez on 24/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmuont = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amounIsFocused: Bool
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmuont / 100 * tipSelection
        return checkAmuont + tipValue
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = totalAmount / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: $checkAmuont,
                        format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                    )
                    .keyboardType(.decimalPad)
                    .focused($amounIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<100) { percentage in
                            Text(percentage, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Total amount (check amount + tips)") {
                    Text(
                        totalAmount,
                        format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                    )
                }
                
                Section("Amount per person") {
                    Text(
                        totalPerPerson,
                        format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                    )
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amounIsFocused {
                    Button("Done") {
                        amounIsFocused = false
                    }
                }
            }
        }
    }
}

//struct ContentView: View {
//    @State private var checkAmount = 0.0
//    @State private var numberOfPeople = 2
//    @State private var tipPercentage = 20
//    @FocusState private var amountIsFocused: Bool
//    let percentages = [10, 15, 20, 25, 0]
//    let currencyCode = Locale.current.currency?.identifier ?? "USD"
//    var total: Double {
//        let tipSelection = Double(tipPercentage)
//        let tipValue = (checkAmount / 100) * tipSelection
//        let grandTotal = checkAmount + tipValue
//        
//        return grandTotal
//    }
//    var totalPerPerson: Double {
//        let peopleCount = Double(numberOfPeople + 2)
//        let amountPerPerson = total / peopleCount
//        return amountPerPerson
//    }
//    
//    var body: some View {
//        NavigationStack {
//            Form {
//                Section {
//                    TextField(
//                        "Amount",
//                        value: $checkAmount,
//                        format: .currency(code: currencyCode)
//                    )
//                    .keyboardType(.decimalPad)
//                    .focused($amountIsFocused)
//                    
//                    Picker("Number of people", selection: $numberOfPeople) {
//                        ForEach(2..<11) { numberOfPeople in
//                            Text("\(numberOfPeople) people")
//                        }
//                    }
//                }
//                
//                Section("How much do you want to tip?") {
//                    Picker("Tip percentage", selection: $tipPercentage) {
////                        ForEach(0...100, id: \.self) { percentage in
////                            Text(percentage, format: .percent)
////                        }
//                        ForEach(percentages, id: \.self) { percentage in
//                            Text(percentage, format: .percent)
//                        }
//                    }
//                    .pickerStyle(.navigationLink)
//                }
//                
//                Section("Total") {
//                    Text(total, format: .currency(code: currencyCode))
//                        .foregroundStyle(tipPercentage != 0 ? .blue : .red)
//                }
//                
//                Section("Amount per person") {
//                    Text(totalPerPerson, format: .currency(code: currencyCode))
//                        .foregroundStyle(tipPercentage != 0 ? .blue : .red)
//                }
//            }
//            .navigationTitle("WeSplit")
//            .toolbar {
//                if amountIsFocused {
//                    Button("Done") {
//                        amountIsFocused = false
//                    }
//                }
//            }
//        }
//    }
//}

#Preview {
    ContentView()
}
