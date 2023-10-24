//
//  PersonEntity+CoreDataProperties.swift
//  BillSpliter
//
//  Created by HubertMac on 24/10/2023.
//
//

import Foundation
import CoreData


extension PersonEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonEntity> {
        return NSFetchRequest<PersonEntity>(entityName: "PersonEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
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

}
