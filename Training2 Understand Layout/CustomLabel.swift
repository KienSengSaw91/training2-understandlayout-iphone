//
//  CustomLabel.swift
//  Training2 Understand Layout
//
//  Created by Gordan Saw on 20/11/2019.
//  Copyright © 2019 Gordan Saw. All rights reserved.
//

import Foundation
import UIKit


public class CustomLabel : UILabel {
    
    
    var margin: UIEdgeInsets
    
    
    public override init(frame: CGRect) {
        margin = UIEdgeInsets.zero
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        margin = UIEdgeInsets.zero
        super.init(coder: coder)
    }
    
    override public func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: margin))
    }
    
}
