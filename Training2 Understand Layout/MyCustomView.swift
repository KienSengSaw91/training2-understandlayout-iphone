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
    
    let messageInfo = "Last log in 2019/11/07 12:00"
    
    var messageLabel: CustomLabel!
    var loginBtn: CustomButton!
    var logoutBtn : CustomButton!
    var settingBtn : CustomButton!
    
    
    override public init(frame: CGRect) {
        super.init(frame:frame)
         setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override public func layoutSubviews() {
        super.layoutSubviews()
        updateLayout()
    }
    
    //Update View Frame Setup
    func updateLayout(){
        
        let width:CGFloat = self.bounds.width
        let messageLabelRect: CGSize = messageLabel.sizeThatFits(CGSize(width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        let logInBtnRect: CGSize = loginBtn.sizeThatFits(CGSize(width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        let logOutBtnRect: CGSize = logoutBtn.sizeThatFits(CGSize(width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        let settingBtnRect: CGSize = settingBtn.sizeThatFits(CGSize(width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        
        var x = width
        
        x -= 10
        x -= settingBtnRect.width
        
        settingBtn.frame = CGRect(x: x,y:30,width: settingBtnRect.width, height: settingBtnRect.height)
        
        if (!loginBtn.isHidden) {
            x -= 10
            x -= logInBtnRect.width
            loginBtn.frame   = CGRect(x: x, y:30,width: logInBtnRect.width,   height: logInBtnRect.height)
        }
        
        if (!logoutBtn.isHidden){
            x -= 10
            x -= logOutBtnRect.width
            logoutBtn.frame  = CGRect(x: x, y:30,width: logOutBtnRect.width,  height: logOutBtnRect.height)
        }
        
        x -= 10
        
        messageLabel.frame = CGRect(x:  10, y:35, width: x - 10,  height: messageLabelRect.height)
    }
    
    
    
    func setupView(){
    
        //messageLabel Setup
        messageLabel = CustomLabel()
        messageLabel.text = messageInfo
        messageLabel.textAlignment = .left
        messageLabel.font = UIFont.systemFont(ofSize: 16)
        messageLabel.sizeToFit()
        
        //loginBtn Setup
        loginBtn = CustomButton()
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.backgroundColor = .blue
        loginBtn.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
        loginBtn.sizeToFit()
        
        //logoutBtn Setup
        logoutBtn = CustomButton()
        logoutBtn.setTitle("Logout", for: .normal)
        logoutBtn.backgroundColor = .red
        logoutBtn.addTarget(self, action: #selector(logoutBtnClick), for: .touchUpInside)
        logoutBtn.sizeToFit()
        
        //settingBtn Setup
        settingBtn = CustomButton()
        settingBtn.setTitle("Settings", for: .normal)
        settingBtn.backgroundColor = .black
        settingBtn.sizeToFit()
        
        addSubview(messageLabel)
        addSubview(loginBtn)
        addSubview(logoutBtn)
        addSubview(settingBtn)
        
        //Button Visible Status
        logoutBtn.isHidden = true
        loginBtn.isHidden = false
    }
    
    // Button Events
    @objc func loginBtnClick(){
        print("loginBtnClick clicked")
        logoutBtn.isHidden = false
        loginBtn.isHidden = true
        setNeedsLayout()//important
    }
    
    @objc func logoutBtnClick(){
        print("logoutBtnClick clicked")
        logoutBtn.isHidden = true
        loginBtn.isHidden = false
        setNeedsLayout()//important
    }
    
}
