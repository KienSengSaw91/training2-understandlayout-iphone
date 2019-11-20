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
    
    public override init(frame: CGRect) {
        super.init(frame:frame)
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setupView(){
        //messageLabel Setup
        messageLabel = CustomLabel(frame: CGRect(x: 0, y: frame.height / 2,width: 0, height: 100))
        messageLabel.text = messageInfo
        messageLabel.textAlignment = .left
        messageLabel.margin = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        messageLabel.font = UIFont.systemFont(ofSize: 16)
        messageLabel.sizeToFit()
        
        //loginBtn Setup
        loginBtn = CustomButton()
        loginBtn.frame = CGRect(x:messageLabel.frame.maxX, y: frame.height / 2, width: 50, height: 50)
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.backgroundColor = .blue
        loginBtn.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
        loginBtn.sizeToFit()
        
        //logoutBtn Setup
        logoutBtn = CustomButton()
        logoutBtn.isHidden = true
        logoutBtn.frame = CGRect(x: messageLabel.frame.maxX, y: frame.height / 2, width: 60, height: 50)
        logoutBtn.setTitle("Logout", for: .normal)
        logoutBtn.backgroundColor = .red
        logoutBtn.addTarget(self, action: #selector(logoutBtnClick), for: .touchUpInside)
        logoutBtn.sizeToFit()
        
        //settingBtn Setup
        settingBtn = CustomButton()
        settingBtn.frame = CGRect(x: logoutBtn.frame.maxX, y: frame.height / 2, width: 70, height: 50)
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
