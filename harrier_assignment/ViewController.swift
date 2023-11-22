//
//  ViewController.swift
//  harrier_assignment
//
//  Created by Ayush Bhople on 22/11/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var container: NSPersistentContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard container != nil else {
            fatalError("This view needs a persistent container.")
        }
        
    }


}

