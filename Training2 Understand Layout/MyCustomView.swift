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
    
    private let messageLabel: UILabel = UILabel()
    private let loginBtn: UIButton = UIButton()
    private let logoutBtn : UIButton = UIButton()
    private let settingBtn : UIButton = UIButton()
    private let switch1 : LabelSwitch = LabelSwitch()
    
    
    override public init(frame: CGRect) {
        super.init(frame:frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        print("layoutSubviews")
        
        
        let width:CGFloat = self.bounds.width
        let messageLabelRect: CGSize = messageLabel.sizeThatFits(CGSize(width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        let switch1Rect: CGSize = switch1.sizeThatFits(CGSize(width: frame.width, height: CGFloat.greatestFiniteMagnitude))
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
            
            x = switch1Rect.width + 10
            loginBtn.frame   = CGRect(x: x, y:30,width: logInBtnRect.width,   height: logInBtnRect.height)
        }
        
        x = messageLabelRect.width + 50
        switch1.frame = CGRect(x: x,y:30,width: switch1Rect.width, height: switch1Rect.height)
        
        x -= 10
        messageLabel.frame = CGRect(x:10, y:35, width: messageLabelRect.width,  height: messageLabelRect.height)
        
        
    }
    
    
    private func setupView(){
        //messageLabel Setup
        messageLabel.text = "Last log in 2019/11/07 12:00"
        messageLabel.textAlignment = .left
        messageLabel.font = UIFont.systemFont(ofSize: 16)
        
        //switch 1 setup
        switch1.setTitle(title: "Automatic Login")
        switch1.buttonTap()
        
        
        //loginBtn Setup
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.backgroundColor = .blue
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        loginBtn.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
        
        //logoutBtn Setup
        logoutBtn.setTitle("Logout", for: .normal)
        logoutBtn.backgroundColor = .red
        logoutBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        logoutBtn.addTarget(self, action: #selector(logoutBtnClick), for: .touchUpInside)
        
        //settingBtn Setup
        settingBtn.setTitle("Settings", for: .normal)
        settingBtn.backgroundColor = .black
        settingBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        addSubview(messageLabel)
        addSubview(switch1)
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
