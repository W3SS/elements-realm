//
//  MenuTextField.swift
//  coredata-practice
//
//  Created by Adrian Padua on 6/9/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class MenuTextView: UITextView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
        layer.cornerRadius = 5.0
        clipsToBounds = true
    }
}
