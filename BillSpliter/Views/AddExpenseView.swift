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
    @State private var owner: PersonEntity?
    
    @State private var showingAddScreenFriend = false
    @State private var showingConfirmationAlert = false
    
    
    var body: some View {
        ZStack {
            Form {
                Section("Fill expense info") {
                    TextField("expense name ", text: $name)
                    TextField("expense amount", value: $amount, format: .currency(code: Bill.localCurrency))
                    
                }
                
                Section("Who pays") {
                    if friends.isEmpty {
                        Text("You have no firends on your list! Add some!")
                            .font(.footnote)
                            .foregroundStyle(Color.red.opacity(0.8))
                    } else {
                        
                        Picker("Choose who pays", selection: $owner) {
                            ForEach(friends) {friend in
                                Text(friend.name ?? "Unknown name").tag(friend as PersonEntity?)
                            }
                        }
                    }
                    
                    Button("Add a new friend"){
                        showingAddScreenFriend = true
                    }
                }
            }
            
            
            Button("Save the expense") {
                let expense = ExpenseEntity(context: moc)
                expense.id = UUID()
                expense.amount = amount
                expense.event = event
                expense.name = name
                expense.owner = owner!
                showingConfirmationAlert = true
            }
            .buttonStyle(.borderedProminent)
            .disabled(owner == nil || name == "" || amount == 0 )
            
        }
        .sheet(isPresented:$showingAddScreenFriend){
            AddPersonView()
        }
        .alert("Save expense?", isPresented: $showingConfirmationAlert) {
            Button {
                try? moc.save()
                name = ""
                amount = 0.0
                owner = nil
                
                dismiss()
            } label: {
                Text("Save")
                    .foregroundStyle(Color.green)
            }
                
        }message: {
            
                Text("Do you want to add this expense:")
                    .font(.headline)
                Group {
                    Text("name - \(name)")
                    Text("amount - \(amount)")
                    Text("who pays - \(owner?.name ?? "")")
                }
                .font(.callout)
                
          
             
            
        }
        
    }
}

#Preview {
    NavigationStack {
        AddExpenseView()
    }
}
