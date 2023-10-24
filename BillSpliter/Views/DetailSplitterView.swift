//
//  DetailSplitterView.swift
//  BillSpliter
//
//  Created by HubertMac on 23/10/2023.
//

import SwiftUI

struct DetailSplitterView: View {
    @StateObject var vm = PersonModel()
    
    @State private var name = ""
    @State private var expenseAmount = 0
    
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack {
            
            Form  {
                Section("Add Person"){
                    TextField("name", text: $name)
                        .focused($isFocused)
                    Button("Save") {
                        let person = Person(name: name, spendedCash: 0)
                        vm.addPerson(person)
                        name = ""
                    }
                    
                }
                Section("Add Expense") {
                    TextField("expense amount", value: $expenseAmount, format: .currency(code: Bill.localCurrency))
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    
                    Picker("Choose a Person", selection: $vm.choosenPerson) {
                        ForEach(vm.friends) { friend in
                            Text(friend.name).tag(friend as Person?)
                        }
                    }
                    .pickerStyle(.automatic)
                    
                    Button("Save expense"){
                        vm.addExpense(expenseAmount)
                        expenseAmount = 0
                    }
                }
                
                    ForEach(vm.friends) { friend in
                        HStack {
                            Text(friend.name)
                                .font(.headline)
                            Spacer()
                            Text("\(friend.spendedCash)")
                                .font(.callout)
                        }
                    }
                
            }
            .navigationTitle("Detail Spliter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done"){
                        isFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    
    DetailSplitterView()
}
