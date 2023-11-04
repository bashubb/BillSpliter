//
//  EventMember+CoreDataProperties.swift
//  BillSpliter
//
//  Created by HubertMac on 02/11/2023.
//
//

import Foundation
import CoreData


extension EventMember {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventMember> {
        return NSFetchRequest<EventMember>(entityName: "EventMember")
    }

    @NSManaged public var eventAmount: Double
    @NSManaged public var eventMember: PersonEntity?
    @NSManaged public var event: EventEntity?

}

extension EventMember : Identifiable {
    public var wrappedEventMember: PersonEntity {
        eventMember ?? PersonEntity()
    }
    
    public var wrappedEvent: EventEntity {
        event ?? EventEntity()
    }
    
  
}
