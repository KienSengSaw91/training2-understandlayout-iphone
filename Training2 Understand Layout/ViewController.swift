//
//  ViewController.swift
//  Training2 Understand Layout
//
//  Created by Gordan Saw on 18/11/2019.
//  Copyright © 2019 Gordan Saw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let myCustomView = MyCustomView(frame: CGRect(x: 0,y: 100,width: 300,height: 300))
    override func viewDidLoad() {
        
       super.viewDidLoad()
       self.view.addSubview(myCustomView)
          print("viewDidLoad")
    }
    

    private func setUpPotraitMode(){
        print("setUpPotraitMode")

       let xPosition = CGFloat(0)
       let yPosition = CGFloat(100)
       let width = myCustomView.frame.size.width
       let height = myCustomView.frame.size.height

       UIView.animate(withDuration: 1.0, animations: {
           self.myCustomView.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
       })
       
    }
    
    private func setUpLandscapeMode(){
         print("setUpLandscapeMode")
      
        let xPosition = myCustomView.frame.origin.x + 100
        let yPosition = myCustomView.frame.origin.y - 20
        let width = myCustomView.frame.size.width
        let height = myCustomView.frame.size.height

        UIView.animate(withDuration: 1.0, animations: {
            self.myCustomView.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        })
       
    }
    
    override func viewWillLayoutSubviews() {

        let oriantation = UIDevice.current.orientation
        if oriantation.isLandscape {
           setUpLandscapeMode()

        }else if oriantation.isPortrait {
            setUpPotraitMode()
        }

    }
}

