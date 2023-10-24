//
//  BillSpliterApp.swift
//  BillSpliter
//
//  Created by HubertMac on 03/10/2023.
//

import SwiftUI

@main
struct BillSpliterApp: App {
    @StateObject private var  dataController  = DataController()
    
    var body: some Scene {
        WindowGroup {
            DetailSplitterView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
