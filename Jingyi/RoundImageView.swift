//
//  RoundImageView.swift
//  Jingyi
//
//  Created by 691 on 16/4/20.
//  Copyright © 2016年 691. All rights reserved.
//

import UIKit
@IBDesignable

class RoundImageView: UIImageView {
    
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = cornerRadius>0}
    }
    @IBInspectable var borderWidth:CGFloat = 0{
        didSet{
        layer.borderWidth = borderWidth}
    }
    
    
    @IBInspectable var borderColor: UIColor?{
        didSet{
            layer.borderColor = borderColor?.CGColor
        }
    }

  

}
