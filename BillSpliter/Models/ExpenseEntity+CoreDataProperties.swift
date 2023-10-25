//
//  ExpenseEntity+CoreDataProperties.swift
//  BillSpliter
//
//  Created by HubertMac on 24/10/2023.
//
//

import Foundation
import CoreData


extension ExpenseEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExpenseEntity> {
        return NSFetchRequest<ExpenseEntity>(entityName: "ExpenseEntity")
    }

    @NSManaged public var amount: Double
    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var person: PersonEntity?
    @NSManaged public var event: EventEntity?

}

extension ExpenseEntity : Identifiable {
    
    public var wrappedName: String {
        name ?? "UnknownName"
    }
}
