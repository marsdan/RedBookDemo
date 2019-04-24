//
//  NSStringExtension.swift
//  RedBook
//
//  Created by peng zhao on 2019/4/24.
//  Copyright © 2019 mars. All rights reserved.
//

import UIKit

func StringSize(string:String,fontSize:CGFloat,maxSize:CGSize) -> CGSize {
    let font = UIFont.systemFont(ofSize: fontSize)
    let rect = NSString(string: string).boundingRect(with: maxSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [.font:font], context: nil)
    return rect.size
}
