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
        ZStack {
            NavigationStack {
                Form {
                    
                    
                    Section("Events") {
                        if events.isEmpty {
                            Text("You have no events on your list! Add some!")
                                .font(.footnote)
                                .foregroundStyle(Color.red.opacity(0.8))
                        } else {
                            List {
                                ForEach(events) {event in
                                    NavigationLink {
                                        EventEditView(event: event)
                                    } label: {
                                        Text(event.name ?? "Unknown name")
                                    }

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
