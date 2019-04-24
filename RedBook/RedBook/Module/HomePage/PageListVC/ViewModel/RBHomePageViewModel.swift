//
//  RBHomePageViewModel.swift
//  RedBook
//
//  Created by peng zhao on 2019/4/23.
//  Copyright © 2019 mars. All rights reserved.
//

import UIKit


enum ViewModelType:Int {
    case Follow = 0
    case Discovery = 1
    case Nearby = 2
}


typealias VoidBlock = () -> Void





/// item ViewModel
class RBHomePageItemViewModel: NSObject {
    var model:RBHomePageItemModel = RBHomePageItemModel()
    
    var describe = ""
    var describeImage:UIImage!
    
    
    var bgImageHeight:CGFloat = 0.0
    var titleSize:CGSize = CGSize.zero
    var titleEdgeInsets:UIEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
    var cellHeight:CGFloat!

    

}



class RBHomePageViewModel: NSObject {

    
    var dataArray:[RBHomePageItemViewModel] = []
    
    
    
    func upDateWithType(type:ViewModelType,responseHeader:@escaping VoidBlock) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute:{
        
            for _ in 1...30 {
                let itemViewModel = RBHomePageItemViewModel()
                  itemViewModel.model.title = "猛龙晋级：首战败北只是意外双卡双待谁受得了";
                    itemViewModel.model.nickname = "宇宙第一泰坦"
                itemViewModel.describeImage = UIImage(named:"icon_like_grey_17_15x17_")
                itemViewModel.describe = "500m"
                
               //背景高度
                itemViewModel.bgImageHeight = CGFloat(arc4random() % 80 + 100);
                //标题高度
                 itemViewModel.titleSize = StringSize(string: itemViewModel.model.title, fontSize: 14, maxSize: CGSize(width: ((kScreenWidth - 6 * 3 )/2.0) - itemViewModel.titleEdgeInsets.left - itemViewModel.titleEdgeInsets.right, height: 50))
                
                itemViewModel.cellHeight = itemViewModel.bgImageHeight;
                
                itemViewModel.cellHeight += itemViewModel.titleEdgeInsets.top + itemViewModel.titleEdgeInsets.bottom  + itemViewModel.titleSize.height;
                
                itemViewModel.cellHeight += 36
                
                
                
               self.dataArray.append(itemViewModel)
            }
            
             responseHeader()
        })
    }
    
    
    
    
    
}
