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
    private var _elementRealm: Realm
    
    let defaultPath = Realm.Configuration.defaultConfiguration.fileURL!
    
    
    var elements: Realm {
        return _elementRealm
    }
    
    init() {
        
        var config = Realm.Configuration.defaultConfiguration
        config.schemaVersion += 1
        
        _elementRealm = try! Realm(configuration: config)
        
//        try! _elementRealm.write {
//            _elementRealm.deleteAll()
//        }
//        
//        addElement("Hydrogen", atomicNumber: 1, chemicalSymbol: "H")
        
        loadElements()
        let dir = _elementRealm.configuration.fileURL!
        print(dir)
    }
    
    
    func addElement(name: String?, atomicNumber: Int?, chemicalSymbol: String?) {
        
        try! _elementRealm.write {
            _elementRealm.add(Element(value: ["name" : name!, "atomicNumber" : atomicNumber!, "chemicalSymbol" : chemicalSymbol!]))
        }
    }
    
    func loadElements() {
        
        _elementRealm.refresh()
        
        
        // Send a notification to the center that elements were loaded
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "elementsLoaded", object: nil))
    }
}