//
//  Person.swift
//  BillSpliter
//
//  Created by HubertMac on 23/10/2023.
//

import Foundation

struct Person: Codable, Identifiable, Hashable{
    var id = UUID()
    var name = ""
    var spendedCash = 0
}
