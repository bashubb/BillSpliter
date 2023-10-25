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
    
    var event: EventEntity
    
    
    var body: some View {
        VStack {
            Text("Your expenses for event \(event.name ?? "Unknown name")")
                .font(.title)
                .padding()
                .background(Color.gray.opacity(0.8))
            
            ForEach(fetchedEvents) {fetchedEvent in
                if fetchedEvent.id == event.id {
                    if fetchedEvent.expenseArray.isEmpty {
                        Text("Looks like you don't have any expenses for this event add some!")
                    } else {
                        ForEach(fetchedEvent.expenseArray) { expense in
                            Section {
                                Text(expense.wrappedName)
                                    .font(.headline)
                                Text(expense.person?.name ?? "Unknown name")
                                    .font(.caption)
                                Text(String(expense.amount))
                                    .font(.caption)
                            }
                        }
                    }
                }
            }
            
            
            
            NavigationLink("Add expense") {
                AddExpenseView(event: event)
            }
        }
    }
}


