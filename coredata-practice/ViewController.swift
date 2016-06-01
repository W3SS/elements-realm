//
//  ViewController.swift
//  coredata-practice
//
//  Created by Adrian Padua on 5/31/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var logTextView: UITextView!
    
    // MARK: boilerplate
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: ViewController Buttons

    @IBAction func createBtnPressed(sender: AnyObject) {
        
        createElement("Hydrogen", atomicNumber: 1.0)
    }
    @IBAction func fetchBtnPressed(sender: AnyObject) {
        fetchElements()
    }
    @IBAction func updateBtnPressed(sender: AnyObject) {
    }
    @IBAction func deleteBtnPressed(sender: AnyObject) {
    }
    
    // MARK: CoreData Actions
    
    func createElement(name: String, atomicNumber: Double) {
        
        var elements = [NSManagedObject]()
        
        // 1 Get AppDelegate Object
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // 2 Get ManagedContextObject using the AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        // 3 Create Entity Description with your entity name
        let entity = NSEntityDescription.entityForName("Element", inManagedObjectContext: managedContext)
        
        // 4 Create Managed Object with help of entity and managedContext
        let elementObj = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        // 5 Set values for represented attributes
        elementObj.setValue("Hydrogen", forKey: "name")
        elementObj.setValue(1.0, forKey: "atomicNumber")
        
        // 6 Handle the exception
        do {
            try managedContext.save()
            elements.append(elementObj)
            
            logTextView.text = "Element added to local Database."
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    
    func fetchElements() {
        // 1 Initialize fetch request
        let fetchRequest = NSFetchRequest()
        
        // 2 Get AppDelegate object
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // 3 Get ManagedObjectContext with the help of AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        // 4 Create entity description
        let entityDescription = NSEntityDescription.entityForName("Element", inManagedObjectContext: managedContext)
        
        // 5 Configure fetch request
        fetchRequest.entity = entityDescription
        
        do {
            let result = try managedContext.executeFetchRequest(fetchRequest)
            if (result.count > 0) {
                let elementObj = result[0] as! NSManagedObject
                if let name = elementObj.valueForKey("name"), atomicNumber = elementObj.valueForKey("atomicNumber"){
                    let output: NSString = "\(name) - Atomic Number: \(atomicNumber)"
                    print(output)
                    logTextView.text = "Element record is added to local Database. \n" + (output as String)
                }
            } else {
                logTextView.text = "No element records found int he local Database"
            }
        } catch {
            let fetchError = error as NSError
            print("Error", fetchError)
        }
    }
}











