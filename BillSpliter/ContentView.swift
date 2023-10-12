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
    @State private var tipAmountinPercent = 20
    @State private var tipAmountinCash = 0
    @State private var isTipInPercent = true
    @FocusState private var isFocused: Bool
    
    
    var localCurrency = Locale.current.currency?.identifier ?? "PLN"
    
    var total: (Double, Double) {
        // calculate total with tip and total per person

        let grandTotal = grandTotalCalculation()
        
        let totalPerPerson = grandTotal / Double(noOfPeople)
        
        return(grandTotal, totalPerPerson)
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                
                // Amount
                Section {
                    TextField("Check Amount", value: $checkAmount, format: .currency(code: localCurrency))
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    
                    Picker("Number of people", selection: $noOfPeople){
                        ForEach(0..<100){
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                
                // Tip
                Section {
                    HStack {
                        Text("Tip")
                        Toggle(isTipInPercent ? "percentage" : "cash value", isOn: $isTipInPercent)
                    }
                    if isTipInPercent {
                        Picker("Tip percentage", selection: $tipAmountinPercent){
                            ForEach(0..<51){
                                if ($0 % 10) == 0 {
                                    Text($0 ,format: .percent)
                                }
                            }
                        }
                        .labelsHidden()
                    } else {
                        HStack {
                            Text("Enter your tip")
                                
                            TextField("Your tip", value: $tipAmountinCash, format: .currency(code: localCurrency) )
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.decimalPad)
                                .focused($isFocused)
                        }
                    }
                   
                } header: {
                    Text("HOW MUCH TIP DO YOU WANT TO LEAVE ?")
                }
            
                
                // Amount per person
                Section {
                    Text(total.1, format: .currency(code: "PLN"))
                        .noTipColor(tipAmount: isTipInPercent ? tipAmountinPercent : tipAmountinCash)
                } header: {
                    Text("AMOUNT PER PERSON")
                }
            
                
                // Total amount
                Section {
                    Text(total.0, format: .currency(code: "PLN"))
                        .noTipColor(tipAmount: isTipInPercent ? tipAmountinPercent : tipAmountinCash)
                } header: {
                    Text("TOTAL WITH TIP")
                }
                
            }
            .navigationTitle("Bill Spliter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done"){
                        isFocused = false
                    }
                }
            }
        }
        .animation(.default, value: isTipInPercent)
    }
    
    
    
    func grandTotalCalculation() -> Double {
        let total = (isTipInPercent ?
                     checkAmount + (checkAmount * Double(( tipAmountinPercent  / 100))) :
                     checkAmount + Double(tipAmountinCash))
        return total
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
