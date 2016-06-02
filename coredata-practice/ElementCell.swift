//
//  ElementCell.swift
//  coredata-practice
//
//  Created by Adrian Padua on 6/2/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit
import CoreData

class ElementCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var atomicNumberLbl: UILabel!
    
    // MARK: UITableViewCell boilerplate
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(element: NSManagedObject) {
        self.nameLbl.text = element.valueForKey("name") as? String
        self.atomicNumberLbl.text = element.valueForKey("atomicNumber")?.stringValue
    }

}
