//
//  ElementsData.swift
//  coredata-practice
//
//  Created by Adrian Padua on 6/2/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ElementsData {
    
    static let instance = ElementsData()
    
    private var _elements = [NSManagedObject]()
    
    init() {
        
        // MARK: CoreData setup
        // 1 Get AppDelegate object
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // 2 Get ManagedObjectContext from appDelegate
        let managedContext = appDelegate.managedObjectContext
        
        // 3 Create Entity Description with your entity name
        let entity = NSEntityDescription.entityForName("Element", inManagedObjectContext: managedContext)
        
        // 4 Initialize fetch request
        let fetchRequest = NSFetchRequest()
        
        // 5 Configure fetch request
        fetchRequest.entity = entity
        
        // 6 Store fetched data into array
        do {
            let result = try managedContext.executeFetchRequest(fetchRequest)
            _elements = result as! [NSManagedObject]
        } catch {
            let fetchError = error as NSError
            print("Error", fetchError)
        }

        print("Count = \(_elements.count)")
        
    }
    
    var elements: [NSManagedObject] {
        return _elements
    }
    
    func append(item: NSManagedObject) {
        _elements.append(item)
        print(item.valueForKey("name") as! String)
        print(_elements.count)
    }
}