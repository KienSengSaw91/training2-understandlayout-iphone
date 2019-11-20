//
//  CustomButton.swift
//  Training2 Understand Layout
//
//  Created by Gordan Saw on 20/11/2019.
//  Copyright © 2019 Gordan Saw. All rights reserved.
//

import Foundation
import UIKit

public class CustomButton : UIButton {
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    override public func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
        super.systemLayoutSizeFitting(targetSize)
    }
    
    func setupLayout(){
        
       titleLabel?.font = titleLabel?.font.withSize(16)
    }
    
}
