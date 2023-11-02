//
//  ExpenseEntity+CoreDataProperties.swift
//  BillSpliter
//
//  Created by HubertMac on 02/11/2023.
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
    @NSManaged public var event: EventEntity?
    @NSManaged public var owner: PersonEntity?
    @NSManaged public var expenseMember: NSSet?

}

// MARK: Generated accessors for expenseMember
extension ExpenseEntity {

    @objc(addExpenseMemberObject:)
    @NSManaged public func addToExpenseMember(_ value: ExpenseMember)

    @objc(removeExpenseMemberObject:)
    @NSManaged public func removeFromExpenseMember(_ value: ExpenseMember)

    @objc(addExpenseMember:)
    @NSManaged public func addToExpenseMember(_ values: NSSet)

    @objc(removeExpenseMember:)
    @NSManaged public func removeFromExpenseMember(_ values: NSSet)

}

extension ExpenseEntity : Identifiable {
    
    public var wrappedName: String {
        name ?? "UnknownName"
    }
    
    public var wrappedID: UUID {
        id ?? UUID()
    }
    
    
    public var wrappedEvent: EventEntity {
        event ?? EventEntity()
    }
    
    public var wrappedOwner: PersonEntity {
        owner ?? PersonEntity()
    }
}

