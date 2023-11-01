//
//  ExpenseEntity+CoreDataProperties.swift
//  BillSpliter
//
//  Created by HubertMac on 31/10/2023.
//
//

import Foundation
import CoreData


extension ExpenseEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExpenseEntity> {
        return NSFetchRequest<ExpenseEntity>(entityName: "ExpenseEntity")
    }

    @NSManaged public var amount: Double
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var expenseMembers: [PersonEntity : Double]?
    @NSManaged public var event: EventEntity?
    @NSManaged public var owner: PersonEntity?

}

extension ExpenseEntity : Identifiable {
    
    public var wrappedName: String {
        name ?? "UnknownName"
    }
    
    public var wrappedID: UUID {
        id ?? UUID()
    }
    
    public var wrpappedExpenseMembers: [PersonEntity : Double] {
        expenseMembers ?? [:]
    }
    
    public var wrappedEvent: EventEntity {
        event ?? EventEntity()
    }
    
    public var wrappedOwner: PersonEntity {
        owner ?? PersonEntity()
    }
}
