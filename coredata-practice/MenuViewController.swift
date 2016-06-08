//
//  ViewController.swift
//  coredata-practice
//
//  Created by Adrian Padua on 5/31/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var logTextView: UITextView!

    // MARK: UIViewController boilerplate
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: ViewController Buttons

    @IBAction func createBtnPressed(sender: AnyObject) {
        alertPopup()
    }
    @IBAction func fetchBtnPressed(sender: AnyObject) {
        fetchElements()
    }
    @IBAction func updateBtnPressed(sender: AnyObject) {
    }
    @IBAction func deleteBtnPressed(sender: AnyObject) {
    }
    @IBAction func clearLogBtnPressed(sender: AnyObject) {
        clearLog()
    }
    
    // MARK: Realm Actions
    
    func createElement(name: String, atomicNumber: Int) {
        
        clearLog()
        
        ElementsData.instance.addElement(name, atomicNumber: atomicNumber)
        logTextView.text = "\(name) added to local Database."
        
    }
    
    
    func fetchElements() {
        
        let data = ElementsData.instance.elements
        
        clearLog()
        
        if data.objects(Element).count != 0 {
            
            for elementObj in data.objects(Element) {
                let name = elementObj.name, atomicNumber = elementObj.atomicNumber
                let output = "\(atomicNumber) - \(name)"
                    logTextView.text = logTextView.text.stringByAppendingString(output as String)  + "\n"
            }
            
        } else {
            logTextView.text = "No element records found in the local Database"
        }
        
        ElementsData.instance.loadElements()
    }
    
    // MARK: Helper functions
    func clearLog() {
        logTextView.text = ""
    }
    
    func alertPopup() {
        // MARK: Create the alert window and set data
        
        let alert = UIAlertController(title: "New Element", message: "Add a new element", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Add", style: .Default, handler: {
            
            // Handler
            (action: UIAlertAction) -> Void in
            let nameTextField = alert.textFields![0]
            let atomicNumberTextField = alert.textFields![1]
            
            
            if let nameText = nameTextField.text, atomicNumberText = atomicNumberTextField.text {
                
                if !nameText.isEmpty && !atomicNumberText.isEmpty {
                    let atomicNum = Int(atomicNumberText)
                    self.createElement(nameText, atomicNumber: atomicNum!)
                }
            }
            
            // reload data
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: {
            
            // Handler
            (action: UIAlertAction) -> Void in
            
        })
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField) -> Void in
            textField.placeholder = "Name"
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField) -> Void in
            textField.placeholder = "Atomic Number"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
}











