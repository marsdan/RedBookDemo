//
//  RBHomePageItemCollectionViewCell.swift
//  RedBook
//
//  Created by peng zhao on 2019/4/24.
//  Copyright © 2019 mars. All rights reserved.
//

import UIKit


class RBHomePageItemCollectionViewCell: UICollectionViewCell {
    
    var viewModel:RBHomePageItemViewModel!
    
    var bgImageView = UIImageView()
    var titleLabel = UILabel()
    var avatarImageView = UIImageView()
    var nicknameLabel = UILabel()
    var describeLabel = UILabel()
    var describeImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.white
        self.contentView.layer.cornerRadius = 4
        self.contentView.layer.masksToBounds = true
        self.initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI(){
        
        titleLabel.font = UIFont(name: kAPPFontName, size: 13)
        titleLabel.numberOfLines = 0;
        nicknameLabel.font = UIFont(name: kAPPFontName, size: 11)
        nicknameLabel.textColor = UIColor("#6c6c6c")
        
        describeLabel.font = UIFont(name: kAPPFontName, size: 12)
        describeLabel.textColor = UIColor("#6c6c6c")
        self.contentView.sd_addSubviews([bgImageView,titleLabel,avatarImageView,nicknameLabel,describeLabel,describeImageView])
        
        bgImageView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: 0)
        bgImageView.backgroundColor = UIColor.randomColor
        
        avatarImageView.frame = CGRect(x: 6, y: 0, width: 30, height: 30)
        avatarImageView.layer.cornerRadius = avatarImageView.width / 2.0
        avatarImageView.backgroundColor = UIColor.randomColor
        
        _ = avatarImageView.sd_layout().widthIs(24).heightEqualToWidth().leftSpaceToView(self.contentView,6).bottomSpaceToView(self.contentView,6)
        _ = avatarImageView.sd_cornerRadiusFromWidthRatio = NSNumber(value: 0.5)
        
        _ = describeLabel.sd_layout().heightIs(30).autoWidthRatio(0).rightSpaceToView(self.contentView,6).centerYEqualToView(avatarImageView)
        describeLabel.setSingleLineAutoResizeWithMaxWidth(150)
        
        _ = describeImageView.sd_layout().widthIs(15).heightIs(17).centerYEqualToView(describeLabel).rightSpaceToView(describeLabel,4)
        
  
       _ = nicknameLabel.sd_layout().leftSpaceToView(avatarImageView,4).rightSpaceToView(describeImageView,4).heightIs(20).centerYEqualToView(avatarImageView)
 
        
   
        
    }
    func setViewModel(viewModel:RBHomePageItemViewModel){
        self.viewModel = viewModel
        bgImageView.height = viewModel.bgImageHeight
        
        
        titleLabel.frame = CGRect(x: viewModel.titleEdgeInsets.left, y: bgImageView.bottom + viewModel.titleEdgeInsets.top, width: viewModel.titleSize.width, height: viewModel.titleSize.height)
        titleLabel.text = viewModel.model.title
        avatarImageView.y = titleLabel.bottom + viewModel.titleEdgeInsets.bottom
        
        nicknameLabel.text = viewModel.model.nickname
        
        describeLabel.text = viewModel.describe
        describeImageView.image = viewModel.describeImage
    }
    
    
    
    
}
