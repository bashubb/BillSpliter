//
//  AddEventView.swift
//  BillSpliter
//
//  Created by HubertMac on 24/10/2023.
//

import SwiftUI

struct AddEventView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    
    @State var members: [PersonEntity] = []
    @State private var name = ""
    @FocusState var isFocused: Bool
    
    var fontColor = Color(hue: 1.0, saturation: 0.069, brightness: 0.288)
    var backgroundColor = Color(red: 0.949, green: 0.949, blue: 0.971)
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundColor
                    .ignoresSafeArea()
                
                VStack(spacing:0) {
                    VStack(alignment: .leading) {
                        Text("Create the EVENT")
                            .font(.subheadline)
                            .foregroundStyle(fontColor)
                        TextField("event name", text: $name)
                            .focused($isFocused)
                            .autocorrectionDisabled()
                            .padding()
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 8))
                    }
                    .padding()
                    
                    
                    VStack (alignment:.leading){
                        Text("Friends you're adding to event \(name)")
                            .font(.subheadline)
                            .foregroundStyle(fontColor)
                        VStack(alignment: .leading) {
                            if members.isEmpty {
                                Text("There are no firends in this event, add some!")
                                    .font(.callout)
                                    .foregroundStyle(Color.red.opacity(0.5))
                            } else {
                                List {
                                    ForEach(members) {member in
                                        Text(member.wrappedName)
                                            .font(.callout)
                                    }.onDelete { offsets in
                                        members.remove(atOffsets: offsets)
                                    }
                                }
                                .listStyle(.plain)
                                
                            }
                            NavigationLink(destination: AddPersonToEventView(members: $members)) {
                                Text("Add some friends")
                                    .font(.callout)
                            }
                            .buttonStyle(.bordered)
                        }
                        .padding()
                        .background(Color.white, in: .rect(cornerRadius: 8))
                        
                        
                        
                        // TODO: Disabled if no name, no friends , bug: when sheet expends view stays in the middle
                        
                        Button {
                            createEvent()
                            name = ""
                            dismiss()
                        } label: {
                            Text("Create event")
                                .font(.title2)
                        }
                        .padding()
                        .background(Color.blue.opacity(0.8), in: RoundedRectangle(cornerRadius: 8))
                        .foregroundStyle(Color.white)
                        .padding(.top, 20)
                    }
                    .padding([.horizontal, .bottom])
                    
                }
                
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done"){
                        isFocused = false
                    }
                }
            }
            
        }
    }
    
    func createEvent() {
        let newEvent = EventEntity(context: moc)
        newEvent.id = UUID()
        newEvent.date = Date()
        newEvent.name = name
        newEvent.eventMembers = [PersonEntity: Double]()
        for member in members {
            newEvent.eventMembers![member] = 0.0
        }
       
        try? moc.save()
    }
}

#Preview {
    
    AddEventView()
}
