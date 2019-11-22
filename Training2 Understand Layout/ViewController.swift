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
        contentView = MyCustomView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)
        
        //Set Content View Constraint To Center
        contentView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        contentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
}


