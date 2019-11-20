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
        
        contentView = MyCustomView(frame: CGRect(x: 0,y: 0,width: self.view.frame.width,height: 300))
        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(contentView)
        
        //Set Content View Constraint
        contentView.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        contentView.widthAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }
    
    
    private func setUpPotraitMode(){
        print("setUpPotraitMode")
        
        let xPosition = CGFloat(0)
        let yPosition = CGFloat(self.view.frame.height / 2)
        let width = self.view.frame.width
        let height = contentView.frame.size.height / 2
        
        UIView.animate(withDuration: 1.0, animations: {
            self.contentView.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
            //self.contentView.center = self.view.center
        })
        
    }
    
    private func setUpLandscapeMode(){
        print("setUpLandscapeMode")
        
        let xPosition = CGFloat(0)
        let yPosition = self.view.frame.height / 2
        let width = self.view.frame.width
        let height = contentView.frame.size.height / 2
        
        UIView.animate(withDuration: 1.0, animations: {
            self.contentView.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
            //self.contentView.center = self.view.center
        })
        
    }
    
    override func viewWillLayoutSubviews() {
        
        let orientation = UIDevice.current.orientation
        if orientation.isLandscape {
            setUpLandscapeMode()
            
        }else if orientation.isPortrait {
            setUpPotraitMode()
        }
        
    }
    
    
}


