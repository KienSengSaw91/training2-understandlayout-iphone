//
//  LabelSwitch.swift
//  Training2 Understand Layout
//
//  Created by Gordan Saw on 21/11/2019.
//  Copyright © 2019 Gordan Saw. All rights reserved.
//

import Foundation
import UIKit

public class LabelSwitch : UIView {
    
    private let titleLabel : UILabel = UILabel()
    private let switchBtn : UISwitch = UISwitch()
    
    override public init(frame: CGRect) {
        super.init(frame : frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let width : CGFloat = self.bounds.width
        let titleLabelRect: CGSize = titleLabel.sizeThatFits(CGSize(width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        let switchBtnRect: CGSize = switchBtn.sizeThatFits(CGSize(width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        
        var x = width
        
        x += titleLabelRect.width + 5
        switchBtn.frame = CGRect(x: x, y:0, width: switchBtnRect.width,  height: switchBtnRect.height)
        
        titleLabel.frame = CGRect(x: 0, y:5, width: titleLabelRect.width,  height: titleLabelRect.height)
        
        print("titleLabelRect : \(titleLabelRect.width) , switchBtnRect : \(switchBtnRect.width)")
        
    }
    
    public func setTitle(title: String){
        titleLabel.text = title
    }
    
    public func buttonTap(){
        print("buttonTap")
        
        switchBtn.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
        
    }
    
    private func setupView(){
        
        //Set Up title label
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        
        
        switchBtn.isOn = true
        switchBtn.setOn(true, animated: false)
        
        addSubview(titleLabel)
        addSubview(switchBtn)
    }
    
    @objc func switchValueDidChange(_ sender: UISwitch!) {
        
        print("off")
        
        if (sender.isOn == true){
            print("UISwitch state is now ON")
            sender.isOn = false
        }
        else{
            sender.isOn = true
            print("UISwitch state is now Off")
        }
        
        setNeedsLayout()
        
    }
}