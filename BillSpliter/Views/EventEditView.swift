//
//  EventEditView.swift
//  BillSpliter
//
//  Created by HubertMac on 25/10/2023.
//

import SwiftUI

struct EventEditView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest<EventEntity>(sortDescriptors: []) var fetchedEvents
    
    @State private var showingAddExpense = false
    
    var expensesForEventEmpty: Bool {
        for fetchedEvent in fetchedEvents{
            if fetchedEvent.id == event.id {
               return fetchedEvent.expenseArray.isEmpty
            }
        }
        return true
    }
    
    var event: EventEntity
    
    
    var body: some View {
        
        Form {
            
            if expensesForEventEmpty {
                Text("Looks like you don't have any expenses for this event add some!")
            } else {
                
                Section {
                    ForEach(fetchedEvents) {fetchedEvent in
                        if fetchedEvent.id == event.id {
                            ForEach(fetchedEvent.expenseArray) { expense in
                                VStack(alignment: .leading) {
                                    Text(expense.wrappedName)
                                        .font(.headline)
                                    Text(expense.owner?.name ?? "Unknown name")
                                        .font(.callout)
                                    Text(String(expense.amount))
                                        .font(.callout)
                                    // Show who owns whom
                                    ForEach(Array(expense.wrappedExpenseMembers.keys), id:\.self) { key in
                                        Text("\(key.wrappedName) - \(expense.wrappedExpenseMembers[key]!)")
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



