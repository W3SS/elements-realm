//
//  ElementsTableViewController.swift
//  coredata-practice
//
//  Created by Adrian Padua on 6/2/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit
import RealmSwift

class ElementsTableViewController: UITableViewController {

    
    var realm: Realm {
        get {
            return ElementsData.instance.elements
        }
    }
    
    
    
    // MARK: UIViewController boilerplate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initial load
        ElementsData.instance.loadElements()
        
        // Call the onElementsLoaded functions when the elementsLoaded notification is made
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ElementsTableViewController.onElementsLoaded(_:)), name: "elementsLoaded", object: nil)
    }
    
    // MARK: UITableView DataSource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realm.objects(Element).count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ElementCell", forIndexPath: indexPath) as! ElementCell
        
        // Configure the cell...
        let element = realm.objects(Element)[indexPath.row]
        
        cell.configureCell(element)
        
        return cell
    }

    
    
    // MARK: Helper functions
    func onElementsLoaded(notif: NSNotification) {
        tableView.reloadData()
    }
    
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
