//
//  DetailSplitterView.swift
//  BillSpliter
//
//  Created by HubertMac on 23/10/2023.
//

import SwiftUI

struct DetailSplitterView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var friends: FetchedResults<PersonEntity>
    @FetchRequest(sortDescriptors: []) var events: FetchedResults<EventEntity>
    
    @State private var showingAddScreenFriend = false
    @State private var showingAddScreenEvent = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Friends to share expenses") {
                    if friends.isEmpty {
                        Text("You have no firends on your list! Add some!")
                            .font(.footnote)
                            .foregroundStyle(Color.red.opacity(0.8))
                    } else {
                        List {
                            ForEach(friends) {friend in
                                Text(friend.name ?? "Unknown name")
                            }
                        }
                    }
                    
                    Button("Add a new friend"){
                        showingAddScreenFriend = true
                    }
                }
                
                Section("Events") {
                    if events.isEmpty {
                        Text("You have no events on your list! Add some!")
                            .font(.footnote)
                            .foregroundStyle(Color.red.opacity(0.8))
                    } else {
                        List {
                            ForEach(events) {event in
                                Text(event.name ?? "Unknown name")
                            }
                        }
                    }
                    
                    Button("Add a new event"){
                        showingAddScreenEvent = true
                    }
                }
            }
            .navigationTitle("Detail Splitter")
            
        }
        .sheet(isPresented: $showingAddScreenFriend) {
            AddPersonView()
                .presentationDetents([.medium])
            
        }
        .sheet(isPresented: $showingAddScreenEvent){
            AddEventView()
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    
    DetailSplitterView()
}
