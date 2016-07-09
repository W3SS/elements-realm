//
//  NewElementCollectionViewController.swift
//  coredata-practice
//
//  Created by Adrian Padua on 6/9/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class ElementsCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let data = ElementsData.instance.elements.objects(Element)
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        // Call the onElementsLoaded functions when the elementsLoaded notification is made
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ElementsTableViewController.onElementsLoaded(_:)), name: "elementsLoaded", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ElementCell", forIndexPath: indexPath) as? ElementCollectionViewCell {
            
            let elementObj = data[indexPath.row]
            cell.configureCell(elementObj)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    
    
    // MARK: Helper functions
    func onElementsLoaded(notif: NSNotification) {
        collectionView.reloadData()
    }
}
