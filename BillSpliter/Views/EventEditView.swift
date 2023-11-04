//
//  EventEditView.swift
//  BillSpliter
//
//  Created by HubertMac on 25/10/2023.
//

import SwiftUI

struct EventEditView: View {
    
    @State private var showingAddExpense = false
    
    var event: EventEntity
    
    
    var body: some View {
        
        Form {
            
            if event.expenseArray.isEmpty {
                Text("Looks like you don't have any expenses for this event add some!")
            } else {
                
                Section {
                    ForEach(event.expenseArray) { expense in
                        VStack(alignment: .leading) {
                            Text(expense.wrappedName)
                                .font(.headline)
                            Text(expense.wrappedOwner.wrappedName)
                                .font(.callout)
                            Text(String(expense.amount))
                                .font(.callout)
                            List {
                                ForEach(expense.expenseMembersArray) {member in
                                    VStack {
                                        Text(member.wrappedExpenseMember.wrappedName)
                                        Text(String(member.expenseAmount))
                                    }
                                }
                            }
                        }
                    }
                    
                    } header: {
                        Text("Your expenses for event \(event.name ?? "Unknown name")")
                    }
                    
                }
                
                
                Button("Add expense") {
                    showingAddExpense = true
                }
            }
                .navigationTitle("Expenses")
                .sheet(isPresented: $showingAddExpense) {
                    AddExpenseView(event: event)
                }
            
            
        }
        
    }
    
    
    
