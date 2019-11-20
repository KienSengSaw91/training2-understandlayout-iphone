//
//  MyCustomView.swift
//  Training2 Understand Layout
//
//  Created by Gordan Saw on 19/11/2019.
//  Copyright © 2019 Gordan Saw. All rights reserved.
//

import Foundation
import UIKit

public class MyCustomView : UIView {
    var xOffsets : [CGFloat] = []
    
    let messageInfo = "Last log in 2019/11/07 12:00"
    
    var messageLabel: CustomLabel!
    var loginBtn: CustomButton!
    var logoutBtn : CustomButton!
    var settingBtn : CustomButton!
    
    init(height: CGFloat){
        super.init(frame: CGRect(x: 0,y: 0,width: 150, height: height))
        setupView()
    }
    
    
     required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setupView()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        updateLayout()
    }
    
    
    func updateLayout(){
        var width: CGFloat = 0
        
        for i in 0..<subviews.count{
            let view = subviews[i] as UIView
            view.layoutSubviews()
            width += xOffsets[i]
            view.frame.origin.x = width
            width += view.frame.width
        }
        
        self.frame.size.width = width
    }
    
    override public func addSubview(_ view: UIView) {
        xOffsets.append(view.frame.origin.x)
        super.addSubview(view)
    }
    
    func removeAll(){
        for view in subviews{
            view.removeFromSuperview()
        }
        xOffsets.removeAll(keepingCapacity: false)
    }
    
    func setupView(){
        //messageLabel Setup
        messageLabel = CustomLabel(frame: CGRect(x: 10, y: 50,width: 0, height: 0))
        messageLabel.text = messageInfo
        messageLabel.textAlignment = .left
        messageLabel.font = UIFont.systemFont(ofSize: 16)
        messageLabel.sizeToFit()
        
        //loginBtn Setup
        loginBtn = CustomButton()
        loginBtn.frame = CGRect(x:10, y: 50, width: 0, height: 0)
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.backgroundColor = .blue
        loginBtn.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
        loginBtn.sizeToFit()
        
        //logoutBtn Setup
        logoutBtn = CustomButton()
        logoutBtn.isHidden = true
        logoutBtn.frame = CGRect(x:10, y: 50, width: 0, height: 0)
        logoutBtn.setTitle("Logout", for: .normal)
        logoutBtn.backgroundColor = .red
        logoutBtn.addTarget(self, action: #selector(logoutBtnClick), for: .touchUpInside)
        logoutBtn.sizeToFit()
        
        //settingBtn Setup
        settingBtn = CustomButton()
        settingBtn.frame = CGRect(x: 10, y: 50, width: 0, height: 0)
        settingBtn.setTitle("Settings", for: .normal)
        settingBtn.backgroundColor = .black
        settingBtn.sizeToFit()
        
        addSubview(messageLabel)
        addSubview(loginBtn)
        addSubview(logoutBtn)
        addSubview(settingBtn)
    }
    
    
    @objc func loginBtnClick(){
        print("loginBtnClick clicked")
        logoutBtn.isHidden = false
        loginBtn.isHidden = true
    }
    
    @objc func logoutBtnClick(){
        print("logoutBtnClick clicked")
        logoutBtn.isHidden = true
        loginBtn.isHidden = false
    }
    
}
