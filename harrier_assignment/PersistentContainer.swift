//
//  PersistentContainer.swift
//  harrier_assignment
//
//  Created by Ayush Bhople on 22/11/23.
//

import Foundation
import UIKit
import CoreData

class PersistentContainer: NSPersistentContainer {

    func saveContext(backgroundContext: NSManagedObjectContext? = nil) {
        let context = backgroundContext ?? viewContext
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch let error as NSError {
            print("Error: \(error), \(error.userInfo)")
        }
    }
}
