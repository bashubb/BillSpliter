//
//  ContentView.swift
//  BillSpliter
//
//  Created by HubertMac on 03/10/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var bill = Bill()
    @FocusState private var isCheckAmountFocused: Bool
    
    
    var body: some View {
        NavigationStack {
            Form {
                
                // Amount
                Section {
                    TextField("Check Amount", value: $bill.checkAmount, format: .currency(code: bill.localCurrency))
                        .keyboardType(.decimalPad)
                        .focused($isCheckAmountFocused)
                    
                    Picker("Number of people", selection: $bill.noOfPeople){
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
                        Toggle(bill.toggleHeader(isTipInPercent: bill.isTipInPercent), isOn: $bill.isTipInPercent)
                    }
                    
                    TipChooseView(bill: bill, isTipAmountFocused: _isCheckAmountFocused)
                    
                    
                } header: {
                    Text("HOW MUCH TIP DO YOU WANT TO LEAVE ?")
                }
                
                
                // Amount per person
                Section {
                    Text(bill.total.1, format: .currency(code: bill.localCurrency))
                        .noTipColor(tipAmount: bill.tipAmount(isTipInPercent: bill.isTipInPercent), check: bill.checkAmount)
                } header: {
                    Text("AMOUNT PER PERSON")
                }
                
                
                // Total amount
                Section {
                    Text(bill.total.0, format: .currency(code: bill.localCurrency))
                        .noTipColor(tipAmount: bill.tipAmount(isTipInPercent: bill.isTipInPercent), check: bill.checkAmount)
                } header: {
                    Text("TOTAL WITH TIP")
                }
                
            }
            .navigationTitle("Bill Spliter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done"){
                        isCheckAmountFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}




extension View {
    func noTipColor(tipAmount: Int, check: Double) -> some View {
        modifier(NoTip(tipAmount: tipAmount, check: check))
    }
}



struct TipChooseView: View {
    @ObservedObject var bill: Bill
    @FocusState var isTipAmountFocused: Bool
    
    var body: some View {
        VStack {
            if bill.isTipInPercent {
                Picker("Tip percentage", selection: $bill.tipAmountinPercent){
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
                    
                    TextField("Your tip", value: $bill.tipAmountinCash, format: .currency(code: bill.localCurrency) )
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                        .focused($isTipAmountFocused)
                }
            }
        }
        
    }
}




// custom Modifier
struct NoTip: ViewModifier {
    var tipAmount:Int
    var check: Double
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle((tipAmount == 0 && check != 0.0) ? Color.red : Color.primary)
    }
}
