//
//  RootTabBar.swift
//  RedBook
//
//  Created by peng zhao on 2019/4/22.
//  Copyright © 2019 mars. All rights reserved.
//

import UIKit

class RootTabBar: UITabBar {
    
    var centerBtn: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white;
        self.backgroundImage = UIImage()
        self.shadowImage = UIImage()
        self.centerBtn = UIButton()
        self.centerBtn.setBackgroundImage(UIImage.init(named: "tab_camera_h_46x34_"), for: .normal)
        //        self.centerBtn.setBackgroundImage(UIImage.init(named: "tab_camera_h_46x34_"), for: .highlighted)
        self.centerBtn.size = CGSize(width: 46, height: 34)
        self.centerBtn.addTarget(self, action: #selector(centerBtnDidClick), for: .touchUpInside)
        self.addSubview(self.centerBtn)
        

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let btnclass:Any = NSClassFromString("UITabBarButton")!
        self.centerBtn.centerX = self.centerX
        self.centerBtn.centerY = 22
        
        var  btn_W = self.centerBtn.width
             btn_W += 30
        
        var _btnIndex:Int = 0
        for _view in self.subviews {
            if(_view .isKind(of: btnclass as! AnyClass)){
                _view.width = (self.width - btn_W) / 2.0 * 0.5
                if(_btnIndex < 2){
                    _view.x = _view.width * CGFloat(_btnIndex)
                }else{
                    _view.x = _view.width * CGFloat(_btnIndex) + btn_W
                }
                _btnIndex += 1
                if(_btnIndex == 0){
                    _btnIndex += 1
                }
            }
        }
        self.bringSubviewToFront(self.centerBtn)

        
        
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if(self.isHidden == false){
            let newP = self.convert(point, to: self.centerBtn)
            if(self.centerBtn .point(inside: newP, with: event)){
                return self.centerBtn
            }
            
        }
        return super.hitTest(point, with: event)
    }
    
    @objc func centerBtnDidClick(){
        
        
    }
    
}
