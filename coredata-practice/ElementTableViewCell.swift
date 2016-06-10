//
//  ElementCell.swift
//  coredata-practice
//
//  Created by Adrian Padua on 6/2/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class ElementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var atomicNumberLbl: UILabel!
    @IBOutlet weak var chemicalSymbolLbl: UILabel!
    @IBOutlet weak var colorBgView: UIView!
    
    var element: Element!
    
    // MARK: UITableViewCell boilerplate
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        colorBgView.layer.borderColor = UIColor.blackColor().CGColor
        colorBgView.layer.borderWidth = 1.0
        
        colorBgView.layer.cornerRadius = 5.0
        colorBgView.clipsToBounds = true
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(element: Element) {
        
        self.element = element
        
        nameLbl.text = self.element.name.capitalizedString
        atomicNumberLbl.text = "Atomic Number: \(self.element.atomicNumber)"
        chemicalSymbolLbl.text = self.element.chemicalSymbol
    }

}
