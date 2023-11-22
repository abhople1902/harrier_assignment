//
//  InventoryItem+CoreDataProperties.swift
//  harrier_assignment
//
//  Created by Ayush Bhople on 22/11/23.
//
//

import Foundation
import CoreData


extension InventoryItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<InventoryItem> {
        return NSFetchRequest<InventoryItem>(entityName: "InventoryItem")
    }

    @NSManaged public var date: Date?
    @NSManaged public var uid: Int32
    @NSManaged public var name: String?
    @NSManaged public var qty: Int16
    @NSManaged public var cost: Int16
    @NSManaged public var totalCost: Int16
    @NSManaged public var action: Bool

}

extension InventoryItem : Identifiable {

}
