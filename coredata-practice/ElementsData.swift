//
//  ElementsData.swift
//  coredata-practice
//
//  Created by Adrian Padua on 6/2/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class ElementsData {
    
    static let instance = ElementsData()
    
    let _elementRealm = try! Realm()
    
    
    var elements: Realm {
        return _elementRealm
    }
    
    init() {
        loadElements()
        let dir = _elementRealm.configuration.fileURL!
        print(dir)
    }
    
    
    func addElement(name: String?, atomicNumber: Int?) {
        
        try! _elementRealm.write {
            _elementRealm.add(Element(value: ["name" : name!, "atomicNumber" : atomicNumber!]))
        }
    }
    
    func loadElements() {
        
        _elementRealm.refresh()
        
        
        // Send a notification to the center that elements were loaded
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "elementsLoaded", object: nil))
    }
}