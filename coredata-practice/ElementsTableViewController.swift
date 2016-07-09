//
//  NewElementsTableViewController.swift
//  coredata-practice
//
//  Created by Adrian Padua on 6/9/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit
import RealmSwift

class ElementsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let data = ElementsData.instance.elements.objects(Element)
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Call the onElementsLoaded functions when the elementsLoaded notification is made
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ElementsTableViewController.onElementsLoaded(_:)), name: "elementsLoaded", object: nil)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - UITableViewDelegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("ElementCell", forIndexPath: indexPath) as? ElementTableViewCell {
            
            let elementObj = data[indexPath.row]
            cell.configureCell(elementObj)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    // MARK: Helper functions
    func onElementsLoaded(notif: NSNotification) {
        tableView.reloadData()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
