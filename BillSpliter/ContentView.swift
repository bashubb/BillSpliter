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
    
    
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Bill Amount", value: $checkAmount, format: .currency(code: "PLN"))
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
                            Text("\($0)%")
                        }
                    }
                } header: {
                    Text("HOW MUCH TIP DO YOU WANT TO LEAVE ?")
                }
                .pickerStyle(.navigationLink)
                
                Section {
                    Text("Per person")
                } header: {
                    Text("AMOUNT PER PERSON")
                }
            
                
                Section {
                    Text("total")
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

