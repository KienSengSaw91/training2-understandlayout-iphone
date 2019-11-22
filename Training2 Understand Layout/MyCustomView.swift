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
    
        let width:CGFloat = self.bounds.width
        let messageLabelRect: CGSize = messageLabel.sizeThatFits(CGSize(width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        let switch1Rect: CGSize = switch1.sizeThatFits(CGSize(width:frame.width, height: 50))
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
        x -= switch1Rect.width
        switch1.frame = CGRect(x: x,y:30,width: switch1Rect.width, height: switch1Rect.height)
        
        x -= 10
        //x -= messageLabelRect.width
        messageLabel.frame = CGRect(x:0, y:35, width: x - 10,  height: messageLabelRect.height)
        
        
    }
    
    
    private func setupView(){
        
        
        //messageLabel Setup
        messageLabel.text = "Last log in 2019/11/07 12:00"
        messageLabel.textAlignment = .left
        messageLabel.font = UIFont.systemFont(ofSize: 16)
        messageLabel.lineBreakMode = NSLineBreakMode.byTruncatingHead
        
        //switch 1 setup
        switch1.setTitle(title: "Automatic Login")
        
        //loginBtn Setup
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.backgroundColor = .blue
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        loginBtn.titleLabel?.textAlignment = .center
        loginBtn.layer.cornerRadius = 6
        //Add padding around text
        loginBtn.titleEdgeInsets = UIEdgeInsets(top: -10,left: -10,bottom: -10,right: -10)
        loginBtn.contentEdgeInsets = UIEdgeInsets(top: 5,left: 5,bottom: 5,right: 5)
        loginBtn.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
        
        //logoutBtn Setup
        logoutBtn.setTitle("Logout", for: .normal)
        logoutBtn.backgroundColor = .red
        logoutBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        logoutBtn.titleLabel?.textAlignment = .center
        logoutBtn.layer.cornerRadius = 6
        //Add padding around text
        logoutBtn.titleEdgeInsets = UIEdgeInsets(top: -10,left: -10,bottom: -10,right: -10)
        logoutBtn.contentEdgeInsets = UIEdgeInsets(top: 5,left: 5,bottom: 5,right: 5)
        logoutBtn.addTarget(self, action: #selector(logoutBtnClick), for: .touchUpInside)
        
        //settingBtn Setup
        settingBtn.setTitle("Settings", for: .normal)
        settingBtn.backgroundColor = .black
        settingBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        settingBtn.titleLabel?.textAlignment = .center
        settingBtn.layer.cornerRadius = 6
        //Add padding around text
        settingBtn.titleEdgeInsets = UIEdgeInsets(top: -10,left: -10,bottom: -10,right: -10)
        settingBtn.contentEdgeInsets = UIEdgeInsets(top: 5,left: 5,bottom: 5,right: 5)
        
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
