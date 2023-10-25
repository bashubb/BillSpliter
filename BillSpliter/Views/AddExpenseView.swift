//
//  AddExpenseView.swift
//  BillSpliter
//
//  Created by HubertMac on 25/10/2023.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var friends: FetchedResults<PersonEntity>
    @Environment(\.dismiss) var dismiss
    
    var event: EventEntity!
    
    @State private var name = ""
    @State private var amount = 0.0
    @State private var person: PersonEntity?
    
    @State private var showingAddScreenFriend = false
    @State private var showingConfirmationAlert = false
    
    
    var body: some View {
        Form {
            Section {
                TextField("name ", text: $name)
                TextField("amount", value: $amount, format: .currency(code: Bill.localCurrency))
                
            }
            
            Section("Who pays") {
                if friends.isEmpty {
                    Text("You have no firends on your list! Add some!")
                        .font(.footnote)
                        .foregroundStyle(Color.red.opacity(0.8))
                    Button("Add a new friend"){
                        showingAddScreenFriend = true
                    }
                }
                
                Picker("Choose who pays", selection: $person) {
                    ForEach(friends) {friend in
                        Text(friend.name ?? "Unknown name").tag(friend as PersonEntity?)
                    }
                }
            }
            
            Button("Save the expense") {
                let expense = ExpenseEntity(context: moc)
                expense.id = UUID()
                expense.amount = amount
                expense.event = event
                expense.name = name
                expense.person = person!
                showingConfirmationAlert = true
            }
            .disabled(person == nil || name == "" || amount == 0 )
            
            
            
        }
        .alert("Save expense?", isPresented: $showingConfirmationAlert) {
            Button("Save", role:.none) {
                try? moc.save()
                name = ""
                amount = 0.0
                person = nil
                
                dismiss()
            }
        } message: {
            Text("""
                        Do you want to add this expense:
                        name - \(name)
                        amount - \(amount)
                        who pays - \(person?.name ?? "" )
                        """)
            
        }
    }

}

#Preview {
    AddExpenseView()
}
