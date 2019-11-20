//
//  ViewController.swift
//  Training2 Understand Layout
//
//  Created by Gordan Saw on 18/11/2019.
//  Copyright © 2019 Gordan Saw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var contentView : MyCustomView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        contentView = MyCustomView(height: 0)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(contentView)
        
        //Set Content View Constraint To Center
        contentView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        contentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }
    
    
}


