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
    
    let messageInfo = "[Last log in 2019/11/07 12:00]"
 

    lazy var messageLabel: UILabel = {
      let messageLabel = UILabel()
    //messageLabel.isHidden = true
    messageLabel.text = messageInfo
    messageLabel.textAlignment = .left
    messageLabel.font = UIFont.systemFont(ofSize: 16)
    messageLabel.translatesAutoresizingMaskIntoConstraints = false
      return messageLabel
    }()
    
    private lazy var loginBtn: UIButton = {
        let loginBtn = UIButton()
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.backgroundColor = .blue
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        return loginBtn
    }()
    
    private lazy var logoutBtn : UIButton = {
        let logoutBtn = UIButton()
       //logoutBtn.isHidden = true
       logoutBtn.setTitle("Logout", for: .normal)
       logoutBtn.backgroundColor = .red
       logoutBtn.translatesAutoresizingMaskIntoConstraints = false
        return logoutBtn
    }()
    
    private lazy var settingBtn : UIButton = {
    let settingBtn = UIButton()
       settingBtn.setTitle("Settings", for: .normal)
       settingBtn.backgroundColor = .black
       settingBtn.translatesAutoresizingMaskIntoConstraints = false
        
        return settingBtn
    }()
    
    
    private lazy var contentView : UIView = {
        let contentView = UIView()
        contentView.addSubview(messageLabel)
        contentView.addSubview(loginBtn)
        contentView.addSubview(logoutBtn)
        contentView.addSubview(settingBtn)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        return contentView
    }()
    
    
    public override init(frame: CGRect) {
        super.init(frame:frame)
        setupDesign()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupDesign()
    }
    
    private func setupDesign(){
        addSubview(contentView)
        setupConstraint()
        setupButton()
    }
    
    private func setupButton(){
          loginBtn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
          //logoutBtn.addTarget(MyCustomView.self, action: #selector(btnClick(sender:)), for: .touchUpInside)
      }
    
    @objc private func btnClick(){
      print("btnClick clicked")
//      messageLabel.isHidden = false
//      logoutBtn.isHidden = false
//      loginBtn.isHidden = true
   
//           if (sender === loginBtn) {
//               messageLabel.isHidden = false
//               logoutBtn.isHidden = false
//               loginBtn.isHidden = true
//
//                print("btnLogin clicked")
//
//           }
//            else if sender === logoutBtn {
//                   logoutBtn.isHidden = true
//                   loginBtn.isHidden = false
//          }
              
       }
  
    
  
    
    private func setupConstraint(){
        //messageLabel Constraint
        messageLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        //loginBtn Constraint
        loginBtn.leftAnchor.constraint(equalTo: messageLabel.rightAnchor,constant: 10).isActive = true
        loginBtn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        //logoutBtn Constraint
        logoutBtn.leftAnchor.constraint(equalTo: loginBtn.rightAnchor,constant: 10).isActive = true
        logoutBtn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        //settingBtn Constraint
        settingBtn.leftAnchor.constraint(equalTo: logoutBtn.rightAnchor,constant: 10).isActive = true
        settingBtn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
       
    }
    
}
