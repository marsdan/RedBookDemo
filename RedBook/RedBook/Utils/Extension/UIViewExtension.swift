//
//  UIViewExtension.swift
//  Live
//
//  Created by peng zhao on 2018/6/5.
//  Copyright © 2018年 Mars. All rights reserved.
//

import UIKit



///全局函数
func MLog<T>(_ message:T,file:String = #file,funcName:String = #function,lineNum:Int = #line){
    
    #if DEBUG
    
    let file = (file as NSString).lastPathComponent;
    let date = Date()
    
    print("\(date) \(file):(\(lineNum))--\(message)");
    
    #endif
    
    
}



let kAPPFontName = "Helvetica"
let kAPPFontBoldName = "Helvetica-Bold"

let kScreenWidth:CGFloat = UIScreen.main.bounds.size.width

let kScreenHeight:CGFloat = UIScreen.main.bounds.size.height

var kIS_IPHONE_X:Bool{
    get{
        if kScreenHeight >= 812.0 {
            return true
        }else{
            return false
        }
    }
}
let kHeightNavContentBar:CGFloat = 44.0

var kHeightStatusBar:CGFloat{
    get {
        if kIS_IPHONE_X {
            return 44.0
        }else{
            return 20
        }
    }
}
var kHeightNavBar:CGFloat{
    get {
        if kIS_IPHONE_X {
            return 88.0
        }else{
            return 64.0
        }
    }
}
var kHeight_TabBar:CGFloat{
    get {
        if kIS_IPHONE_X {
            return 83.0
        }else{
            return 49.0
        }
    }
}



extension UIView {
    
    public var x:CGFloat {
        get{
            return self.frame.origin.x
        }
        set(x){
            var frame = self.frame
            frame.origin.x = x
            self.frame = frame
            
        }
    }
    public var y:CGFloat {
        get{
            return self.frame.origin.y
        }
        set(y){
            var frame = self.frame
            frame.origin.y = y
            self.frame = frame
            
        }
    }
    public var height:CGFloat {
        get{
            return self.bounds.size.height
        }
        set(height){
            var bounds = self.bounds
            bounds.size.height = height
            self.bounds = bounds
            
        }
    }
    public var width:CGFloat {
        get{
            return self.bounds.size.width
        }
        set(width){
            var bounds = self.bounds
            bounds.size.width = width
            self.bounds = bounds
            
        }
    }
    
    public var size:CGSize {
        get{
            return self.bounds.size
        }
        set(size){
            var bounds = self.bounds
            bounds.size = size
            self.bounds = bounds
            
        }
    }
    
    public var centerX:CGFloat {
        get{
            return self.center.x
        }
        set(centerX){
            
            self.center = CGPoint(x: centerX, y: self.center.y)
        }
    }
    public var centerY:CGFloat {
        get{
            return self.center.y
        }
        set(centerY){
            
            self.center = CGPoint(x: self.center.x, y: centerY)
        }
    }
    
    
    
}
