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
    
    override public func sizeThatFits(_ size: CGSize) -> CGSize {
        let titleLabelSize = self.titleLabel.sizeThatFits(self.frame.size)
        let switchBtnSize = self.switchBtn.sizeThatFits(self.frame.size)
        
        //Add Width titleLabelSize & switchBtnSize
        let width = titleLabelSize.width + switchBtnSize.width + CGFloat(5)// Add gap 5
        
        //Add Height titleLabelSize & switchBtnSize
        let height = max(titleLabelSize.height , switchBtnSize.height)
        
        let totalsize = (CGSize(width: width, height: height))//height,size.height,self.frame.height
        
        print("sizeThatFits : titleLabelSize \(totalsize)")
        return totalsize
        
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let width : CGFloat = self.bounds.width
        let titleLabelRect: CGSize = titleLabel.sizeThatFits(CGSize(width: frame.width, height: frame.height))
        let switchBtnRect: CGSize = switchBtn.sizeThatFits(CGSize(width: frame.width, height: frame.height))
        
        var x = width
        
        titleLabel.frame = CGRect(x: 0, y:5, width: titleLabelRect.width,  height: titleLabelRect.height)
        
        //switchBtn add gap =  5
        x = titleLabelRect.width + 5
        switchBtn.frame = CGRect(x: x, y:0, width: switchBtnRect.width,  height: switchBtnRect.height)
        
    }
    
    public func setTitle(title: String){
        titleLabel.text = title
    }
    
    private func setupView(){
        
        //self.backgroundColor = .cyan
        //Set Up title label
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        
        switchBtn.isOn = true
        switchBtn.setOn(true, animated: false)
        
        addSubview(titleLabel)
        addSubview(switchBtn)
        
    }
    
}
