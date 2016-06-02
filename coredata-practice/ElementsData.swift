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
    
    func append(item: NSManagedObject) {
        _elements.append(item)
    }
}