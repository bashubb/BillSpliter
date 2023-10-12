//
//  Bill.swift
//  BillSpliter
//
//  Created by HubertMac on 12/10/2023.
//

import SwiftUI

class Bill: ObservableObject {
    
    @Published var checkAmount = 0.0
    @Published var noOfPeople = 2
    @Published var tipAmountinPercent = 20
    @Published var tipAmountinCash = 0
    @Published var isTipInPercent = true
    
    
    
    var localCurrency = Locale.current.currency?.identifier ?? "PLN"
    
    var total: (Double, Double) {
        // calculate total with tip and total per person

        let grandTotal = grandTotalCalculation(isTipInPercent: isTipInPercent)
        
        let totalPerPerson = grandTotal / Double(noOfPeople)
        
        return(grandTotal, totalPerPerson)
    }
    
    func grandTotalCalculation(isTipInPercent:Bool) -> Double {
        
        if isTipInPercent {
            let tipValue = checkAmount * (Double(tipAmountinPercent) / 100)
            return checkAmount + tipValue
        }
                   
        return checkAmount + Double(tipAmountinCash)
                    
        
       
    }
    
    
    func tipAmount(isTipInPercent: Bool) -> Int {
        if isTipInPercent {
            return tipAmountinPercent
        }
        return tipAmountinCash
    }
    
    func toggleHeader(isTipInPercent: Bool) -> String {
        isTipInPercent ? "percentage" : "cash"
    }
}
