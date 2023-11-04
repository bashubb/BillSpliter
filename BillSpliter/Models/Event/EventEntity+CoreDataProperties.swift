//
//  EventEntity+CoreDataProperties.swift
//  BillSpliter
//
//  Created by HubertMac on 04/11/2023.
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
    @NSManaged public var total: Double
    @NSManaged public var expense: NSSet?
    @NSManaged public var eventMember: NSSet?

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

// MARK: Generated accessors for eventMember
extension EventEntity {

    @objc(addEventMemberObject:)
    @NSManaged public func addToEventMember(_ value: EventMember)

    @objc(removeEventMemberObject:)
    @NSManaged public func removeFromEventMember(_ value: EventMember)

    @objc(addEventMember:)
    @NSManaged public func addToEventMember(_ values: NSSet)

    @objc(removeEventMember:)
    @NSManaged public func removeFromEventMember(_ values: NSSet)

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
    
   
    public var expenseArray: [ExpenseEntity] {
        let set  = expense as? Set<ExpenseEntity> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
    
    public var eventMembersArray: [EventMember] {
        let set  = eventMember as? Set<EventMember> ?? []
        
        return set.sorted {
            $0.wrappedEventMember.wrappedName < $1.wrappedEventMember.wrappedName
        }
    }
}

