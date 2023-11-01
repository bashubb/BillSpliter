//
//  AddPersonView.swift
//  BillSpliter
//
//  Created by HubertMac on 24/10/2023.
//

import SwiftUI

struct AddPersonView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @FocusState private var isFocused: Bool
    
    
    var body: some View {
        // TODO: change from Form into VStack for half sheet
        Form  {
            Section("Add Person"){
                TextField("name", text: $name)
                    .focused($isFocused)
                    .autocorrectionDisabled()
        
                Button("Save") {
                    let newPerson = PersonEntity(context: moc)
                    newPerson.id = UUID()
                    newPerson.name = name
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
    AddPersonView()
}
