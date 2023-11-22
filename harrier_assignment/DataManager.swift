//
//  DataManager.swift
//  harrier_assignment
//
//  Created by Ayush Bhople on 22/11/23.
//

import Foundation
import CoreData

class DataManager {

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Inventory")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // Add methods for creating, reading, updating, and deleting data.

    // Example: Create a new Inventory Item
    func createInventoryItem(name: String, quantity: Int, date: Date, uid: Int, cost: Int, totalCost: Int, action: Bool) {
        let context = persistentContainer.viewContext
        let newItem = InventoryItem(context: context)
        
        newItem.date = date
        newItem.uid = uid
        newItem.name = name
        newItem.qty = Int16(quantity)
        newItem.cost = cost
        newItem.totalCost = totalCost
        newItem.action = action

        saveContext()
    }


    // Example: Fetch all Inventory Items
    func fetchAllInventoryItems() -> [InventoryItem] {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<InventoryItem> = InventoryItem.fetchRequest()

        do {
            let items = try context.fetch(fetchRequest)
            return items
        } catch {
            print("Error fetching inventory items: \(error)")
            return []
        }
    }

    // Example: Update an Inventory Item
    func updateInventoryItem(item: InventoryItem, newName: String, newQuantity: Int) {
        item.name = newName
        item.quantity = Int16(newQuantity)

        saveContext()
    }

    // Example: Delete an Inventory Item
    func deleteInventoryItem(item: InventoryItem) {
        let context = persistentContainer.viewContext
        context.delete(item)

        saveContext()
    }

    // MARK: - Core Data Saving Support

    private func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

