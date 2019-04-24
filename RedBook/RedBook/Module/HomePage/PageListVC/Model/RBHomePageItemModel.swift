//
//  RBHomePageItemModel.swift
//  RedBook
//
//  Created by peng zhao on 2019/4/23.
//  Copyright © 2019 mars. All rights reserved.
//

import UIKit



enum itemType:Int {
    /// 图片
    case picture = 1
    /// 视频
    case video   = 2
}

class RBHomePageItemModel: BaseModel {
    
    /// 标题
    var title:String!
    /// 类别
    var itemType:itemType!
    /// 背景URL
    var itemBGImageURL:String!
    /// 昵称
    var nickname:String!
    /// 用户头像
    var avatar:String!
    /// 距离
    var distance:String!
    /// 点赞数量
    var likeNumber:String!
}
