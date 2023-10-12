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
    @FocusState private var amountIsFocused: Bool
    
    
    var localCurrency = Locale.current.currency?.identifier ?? "PLN"
    
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
                    TextField("Check Amount", value: $checkAmount, format: .currency(code: localCurrency))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
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
                    }.pickerStyle(.navigationLink)
                } header: {
                    Text("HOW MUCH TIP DO YOU WANT TO LEAVE ?")
                }
            
                
                
                Section {
                    Text(total.1, format: .currency(code: "PLN"))
                        .noTipColor(tipAmount: tipAmount)
                } header: {
                    Text("AMOUNT PER PERSON")
                }
            
                
                Section {
                    Text(total.0, format: .currency(code: "PLN"))
                        .noTipColor(tipAmount: tipAmount)
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





extension View {
    func noTipColor(tipAmount: Int) -> some View {
        modifier(NoTip(tipAmount: tipAmount))
    }
}




// custom Modifier
struct NoTip: ViewModifier {
    var tipAmount:Int
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(tipAmount == 0 ? Color.red : Color.primary)
    }
    
    
}
