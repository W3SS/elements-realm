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
    
    var elements: [NSManagedObject] {
        return _elements
    }
    
    var appDelegate: AppDelegate
    var managedContext: NSManagedObjectContext
    var entity: NSEntityDescription
    
    init() {
        
        // MARK: CoreData setup
        
        // 1 Get AppDelegate object
        appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // 2 Get ManagedObjectContext from appDelegate
        managedContext = appDelegate.managedObjectContext
        
        // 3 Create Entity Description with your entity name
        entity = NSEntityDescription.entityForName("Element", inManagedObjectContext: managedContext)!
        
        loadElements()
    }
    
    
    /*
    func addElement(element: NSManagedObject) {
        _elements.append(element)
        print(element.valueForKey("name") as! String)
        print(_elements.count)
    }
    */
    
    func addElement(name: String?, atomicNumber: Int16?) -> Bool {
        
        if let name = name, atomicNumber = atomicNumber {
            
            // 4 Create Managed Object with help of entity and managedContext
            let elementObj = NSManagedObject(entity: entity, insertIntoManagedObjectContext: managedContext)
            
            // 5 Set values for represented attributes
            elementObj.setValue(name, forKey: "name")
            elementObj.setValue(NSNumber(short: atomicNumber), forKey: "atomicNumber")
            
            // 6 Handle the exception
            do {
                try managedContext.save()
                _elements.append(elementObj)
                
                loadElements()
                
                return true
                
            } catch let error as NSError {
                print("Could not save \(error), \(error.userInfo)")
            }
        }
        
        return false
    }
    
    func loadElements() {
        
        // MARK: CoreData fetching
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
        
        // Send a notification to the center that elements were loaded
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "elementsLoaded", object: nil))
        

    }
}