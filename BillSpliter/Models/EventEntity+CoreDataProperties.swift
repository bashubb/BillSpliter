//
//  EventEntity+CoreDataProperties.swift
//  BillSpliter
//
//  Created by HubertMac on 31/10/2023.
//
//

import Foundation
import CoreData


extension EventEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventEntity> {
        return NSFetchRequest<EventEntity>(entityName: "EventEntity")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var eventMembers: [PersonEntity : Double]?
    @NSManaged public var total: Double
    @NSManaged public var expense: NSSet?

}

// MARK: Generated accessors for expense
extension EventEntity {

    @objc(addExpenseObject:)
    @NSManaged public func addToExpense(_ value: ExpenseEntity)

    @objc(removeExpenseObject:)
    @NSManaged public func removeFromExpense(_ value: ExpenseEntity)

    @objc(addExpense:)
    @NSManaged public func addToExpense(_ values: NSSet)

    @objc(removeExpense:)
    @NSManaged public func removeFromExpense(_ values: NSSet)

}

extension EventEntity : Identifiable {
    
    public var wrappedDate: Date {
        date ?? Date()
    }
    
    public var wrappedID: UUID {
        id ?? UUID()
    }
    
    public var wrappedName: String {
        name ?? "Unknown name"
    }
    
    public var wrappedEventMembers: [PersonEntity : Double] {
        eventMembers ?? [:]
    }
    
    
    public var expenseArray: [ExpenseEntity] {
        let set  = expense as? Set<ExpenseEntity> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
}
