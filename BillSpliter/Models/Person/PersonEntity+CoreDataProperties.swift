//
//  PersonEntity+CoreDataProperties.swift
//  BillSpliter
//
//  Created by HubertMac on 02/11/2023.
//
//

import Foundation
import CoreData


extension PersonEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonEntity> {
        return NSFetchRequest<PersonEntity>(entityName: "PersonEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var expense: NSSet?
    @NSManaged public var eventMember: NSSet?
    @NSManaged public var expenseMember: NSSet?

}

// MARK: Generated accessors for expense
extension PersonEntity {

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
extension PersonEntity {

    @objc(addEventMemberObject:)
    @NSManaged public func addToEventMember(_ value: EventMember)

    @objc(removeEventMemberObject:)
    @NSManaged public func removeFromEventMember(_ value: EventMember)

    @objc(addEventMember:)
    @NSManaged public func addToEventMember(_ values: NSSet)

    @objc(removeEventMember:)
    @NSManaged public func removeFromEventMember(_ values: NSSet)

}

// MARK: Generated accessors for expenseMember
extension PersonEntity {

    @objc(addExpenseMemberObject:)
    @NSManaged public func addToExpenseMember(_ value: ExpenseMember)

    @objc(removeExpenseMemberObject:)
    @NSManaged public func removeFromExpenseMember(_ value: ExpenseMember)

    @objc(addExpenseMember:)
    @NSManaged public func addToExpenseMember(_ values: NSSet)

    @objc(removeExpenseMember:)
    @NSManaged public func removeFromExpenseMember(_ values: NSSet)

}

extension PersonEntity : Identifiable {

    public var wrappedName: String {
        name ?? "Unknown name"
    }
    
    public var wrappedID: UUID {
        id ?? UUID()
    }
    
    public var expenseArray: [ExpenseEntity] {
        let set  = expense as? Set<ExpenseEntity> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
    
    public var expenseMemberArray: [ExpenseMember] {
        let set  = expenseMember as? Set<ExpenseMember> ?? []
        
        return set.sorted {
            $0.wrappedExpenseMember.wrappedName < $1.wrappedExpenseMember.wrappedName
        }
    }
    
    public var eventMemberArray: [EventMember] {
        let set  = eventMember as? Set<EventMember> ?? []
        
        return set.sorted {
            $0.wrappedEventMember.wrappedName < $1.wrappedEventMember.wrappedName
        }
    }
}
