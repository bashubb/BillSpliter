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
    
    @State private var name = ""
    @FocusState var isFocused: Bool
    
    var body: some View {
        Form {
            Section("ADD EVENT") {
                TextField("event name", text: $name)
                    .focused($isFocused)
                    .autocorrectionDisabled()
                    
                Button("Save") {
                    let newEvent = EventEntity(context: moc)
                    newEvent.id = UUID()
                    newEvent.date = Date()
                    newEvent.name = name
                    try? moc.save()
                    
                    name = ""
                    dismiss()
                    
                }
                .buttonStyle(.borderedProminent)
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

#Preview {
    
    AddEventView()
}
