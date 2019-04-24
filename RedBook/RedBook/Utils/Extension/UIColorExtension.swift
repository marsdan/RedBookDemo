//
//  UIColorExtension.swift
//  IM
//
//  Created by peng zhao on 2018/12/17.
//  Copyright © 2018 mars. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

extension UIColor {
    public class var masterColor:UIColor {
        get {
            return UIColor("12312312")
        }
    }
    public class var viewBGColor:UIColor {
        get {
            return UIColor("#eeeeee")
        }
    }
    public class var randomColor:UIColor {
        get {
            
            let aRedValue:CGFloat = CGFloat(arc4random() % 255);
            let aGreenValue:CGFloat = CGFloat(arc4random() % 255);
            let aBlueValue:CGFloat = CGFloat(arc4random() % 255);
            return UIColor(red: aRedValue/255.0, green: aGreenValue/255.0, blue: aBlueValue/255.0, alpha: 1.0)
        }
    }

    
}
