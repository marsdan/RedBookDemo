//
//  HomePageSearchView.swift
//  RedBook
//
//  Created by peng zhao on 2019/4/22.
//  Copyright © 2019 mars. All rights reserved.
//

import UIKit
//import SnapKit

class RBHomePageSearchView: UIView {

    var titleBtn:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func initUI() {
        
        
        titleBtn = UIButton.init(type: .custom)
        titleBtn.setTitle("大家都在搜”魔兽世界怀旧版”", for: .normal)
        titleBtn.setImage(UIImage.init(named: "icon_search_grey_17_17x17_"), for: .normal)
        titleBtn.setImage(UIImage.init(named: "icon_search_grey_17_17x17_"), for: .highlighted)
        titleBtn.titleLabel?.textAlignment = .center
        titleBtn.setTitleColor(UIColor.lightGray, for: .normal)
        titleBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        titleBtn.backgroundColor =  UIColor(red:0.93, green:0.93, blue:0.94, alpha:1.00)
        
        self.addSubview(titleBtn)

        titleBtn.layer.cornerRadius = 20.0;
        
       _ = titleBtn.sd_layout().spaceToSuperView(UIEdgeInsets(top: 4, left: 20, bottom: 6, right: 20))
        _ = titleBtn.sd_cornerRadiusFromHeightRatio = (NSNumber(value: 0.5))
        _ = titleBtn.imageView?.sd_layout().widthIs(20).heightEqualToWidth().centerYEqualToView(titleBtn).rightSpaceToView(self.titleBtn.titleLabel!,4)
 
    }
    
}
