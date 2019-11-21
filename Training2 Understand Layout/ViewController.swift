//
//  ViewController.swift
//  Training2 Understand Layout
//
//  Created by Gordan Saw on 18/11/2019.
//  Copyright © 2019 Gordan Saw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var contentView = MyCustomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(contentView)
    }
    
    override func viewWillLayoutSubviews() {
        
        let orientation = UIDevice.current.orientation
        if (orientation.isLandscape){//If Landscape Mode
            print("setUpLandscapeMode")
            view.layoutIfNeeded()
            contentView.translatesAutoresizingMaskIntoConstraints = false
            
            //Set Content View Constraint To Center
            self.contentView.widthAnchor.constraint(equalToConstant: self.view.frame.width / 1.2).isActive = true
            self.contentView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            self.contentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.contentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            
        }else if (orientation.isPortrait) {//If Potrait Mode
            print("setUpPotraitMode")
            view.layoutIfNeeded()
            contentView.translatesAutoresizingMaskIntoConstraints = false
            
            //Set Content View Constraint To Center
            self.contentView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
            self.contentView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            self.contentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.contentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            
        }
        
    }
}


