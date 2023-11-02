//
//  ExpenseMember+CoreDataProperties.swift
//  BillSpliter
//
//  Created by HubertMac on 02/11/2023.
//
//

import Foundation
import CoreData


extension ExpenseMember {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExpenseMember> {
        return NSFetchRequest<ExpenseMember>(entityName: "ExpenseMember")
    }

    @NSManaged public var expenseAmount: Double
    @NSManaged public var expenseMember: PersonEntity?
    @NSManaged public var expense: ExpenseEntity?

}

extension ExpenseMember : Identifiable {

}
