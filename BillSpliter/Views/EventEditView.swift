//
//  EventEditView.swift
//  BillSpliter
//
//  Created by HubertMac on 25/10/2023.
//

import SwiftUI

struct EventEditView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest<ExpenseEntity>(sortDescriptors: [],
                                 predicate: <#T##NSPredicate?#>)
    
    var event: EventEntity?
    

    var body: some View {
        NavigationStack {
            Form {
                Text("Your expenses for this event")
                
                Text("Add some expenses for event \(event?.name ?? "Unknown event")")
                
                NavigationLink("Add expense") {
                    AddExpenseView(event: event)
                }
            }
            
            
        }
    }
}


