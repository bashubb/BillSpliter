//
//  AddPersonToExpenseView.swift
//  BillSpliter
//
//  Created by HubertMac on 01/11/2023.
//

import SwiftUI

struct AddPersonToExpenseView: View {

    var event: EventEntity!
    var owner: PersonEntity!
    var eventMembers: [PersonEntity]
    
    @Binding var expenseMembers: [PersonEntity]
    @State var membersToChoose = [PersonEntity]()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(membersToChoose){ member in
                    Button {
                        if expenseMembers.contains(member) {
                            expenseMembers.removeAll(where: {$0.id == member.id})
                        } else {
                            expenseMembers.append(member)
                        }
                    } label: {
                        Text("\(member.wrappedName)")
                    }
                    .listRowBackground(expenseMembers.contains(member) ? Color.green : Color.clear)
                    
                }
            }
            .listStyle(.plain)
        }
        .onAppear(perform: membersWithoutOwner)
    }
    
    func membersWithoutOwner() {
        for member in eventMembers{
            if member.wrappedID == owner.wrappedID {
                continue
            } else {
                membersToChoose.append(member)
            }
        }
    }
    
}


