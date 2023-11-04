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
    
    var event: EventEntity
    
    @State private var name = ""
    @State private var amount = 0.0
    @State private var owner: PersonEntity?
    
    @State private var showingAddScreenFriend = false
    @State private var showingConfirmationAlert = false
    @State private var expenseMembers = [PersonEntity]()
    
    
    
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
                            ForEach(event.eventMembersArray) {member in
                                Text(member.wrappedEventMember.wrappedName).tag(member.wrappedEventMember as PersonEntity?)
                            }
                        }
                    }
                    
                    
                    // TODO: change adding fr
                    Button("who's paying back?"){
                        showingAddScreenFriend = true
                    }
                    
                    List(expenseMembers) {member in
                        Text(member.wrappedName)
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
                
               
                for member in expenseMembers {
                    let newExpenseMember = ExpenseMember(context: moc)
                    newExpenseMember.expenseMember = member
                    newExpenseMember.expenseAmount = calculateForPerson()
                    newExpenseMember.expense = expense
                    
                }
                showingConfirmationAlert = true
            }
            .buttonStyle(.borderedProminent)
            .disabled(owner == nil || name == "" || amount == 0 )
            
        }
        .sheet(isPresented:$showingAddScreenFriend){
            AddPersonToExpenseView(event: event, owner: owner, /*eventMembers: members*/ expenseMembers: $expenseMembers)
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
    
    func calculateForPerson() -> Double {
        amount / Double(expenseMembers.count)
    }
}


