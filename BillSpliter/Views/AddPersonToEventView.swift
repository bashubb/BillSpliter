//
//  AddPersonToEventView.swift
//  BillSpliter
//
//  Created by HubertMac on 31/10/2023.
//

import SwiftUI

struct AddPersonToEventView: View {
    @FetchRequest(sortDescriptors: []) var friends: FetchedResults<PersonEntity>
    @Binding var members: [PersonEntity]
    
    @State private var showingAddScreenFriend = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(friends) {friend in
                    Button {
                        if members.contains(friend) {
                            members.removeAll(where: {$0.id == friend.id})
                        } else {
                            members.append(friend)
                        }
                    } label: {
                        Text("\(friend.name!)")
                    }
                    .listRowBackground(members.contains(friend) ? Color.green : Color.clear)

                    
                }
            }
            .listStyle(.plain)
            
            Button("Add Friend"){
                showingAddScreenFriend = true
            }
            
            Spacer()
        }
        .sheet(isPresented: $showingAddScreenFriend) {
            AddPersonView()
                .presentationDetents([.medium])
        }
    }
}


