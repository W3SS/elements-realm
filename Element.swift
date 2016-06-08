//
//  Element.swift
//  coredata-practice
//
//  Created by Adrian Padua on 6/2/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import Foundation
import RealmSwift

class Element: Object {
    dynamic var name = ""
    dynamic var atomicNumber = 0
    dynamic var atomicMass = 0.0
    dynamic var category = ""
    
    override var description: String {
        return "\(name). Number: \(atomicNumber). Atomic Mass: \(atomicMass). Category: \(category)"
    }
    
    func category(category: Category) {
        self.category = category.category
    }
}

class Category {
    
    var category: String
    
    init(category: String) {
        self.category = category
    }
    
}