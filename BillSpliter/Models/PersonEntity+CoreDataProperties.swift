//
//  PersonEntity+CoreDataProperties.swift
//  BillSpliter
//
//  Created by HubertMac on 01/11/2023.
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
}

