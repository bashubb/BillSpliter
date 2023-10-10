//
//  ContentView.swift
//  BillSpliter
//
//  Created by HubertMac on 03/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var noOfPeople = 2
    @State private var tipAmount = 20
    
    
    var total: (Double, Double) {
        // calculate total with tip and total per person
        let grandTotal = checkAmount + (checkAmount * Double((tipAmount / 100)))
        let totalPerPerson = grandTotal / Double(noOfPeople)
        
        return(grandTotal, totalPerPerson)
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Check Amount", value: $checkAmount, format: .currency(code: "PLN"))
                    Picker("Number of people", selection: $noOfPeople){
                        ForEach(0..<100){
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section {
                    Picker("Tip precentage", selection: $tipAmount){
                        ForEach(0..<51){
                            Text($0 ,format: .percent)
                        }
                    }
                } header: {
                    Text("HOW MUCH TIP DO YOU WANT TO LEAVE ?")
                }
                .pickerStyle(.navigationLink)
                
                Section {
                    Text(total.1, format: .currency(code: "PLN"))
                } header: {
                    Text("AMOUNT PER PERSON")
                }
            
                
                Section {
                    Text(total.0, format: .currency(code: "PLN"))
                } header: {
                    Text("TOTAL WITH TIP")
                }
                
            }
            .navigationTitle("Bill Spliter")
        }
    }
}

#Preview {
    ContentView()
}

