//
//  ElementCollectionViewCell.swift
//  coredata-practice
//
//  Created by Adrian Padua on 6/9/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class ElementCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var atomicNumberLbl: UILabel!
    @IBOutlet weak var symbolLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var colorBGView: UIView!
    
    var element: Element!
    
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    var screenWidth: CGFloat {
        return screenSize.width
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.borderColor = UIColor.blackColor().CGColor
        layer.borderWidth = 1.0
        frame.size.width = screenWidth / 3
        frame.size.height = screenWidth / 3
        
        layer.cornerRadius = 5.0
        clipsToBounds = true
    }
    
    func configureCell(element: Element) {
        
        self.element = element
        
        
        nameLbl.text = self.element.name.capitalizedString
        atomicNumberLbl.text = String(self.element.atomicNumber)
        symbolLbl.text = self.element.chemicalSymbol as String
    }
}
