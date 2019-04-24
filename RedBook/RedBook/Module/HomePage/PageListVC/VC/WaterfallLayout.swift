//
//  WaterfallLayout.swift
//  RedBook
//
//  Created by peng zhao on 2019/4/24.
//  Copyright © 2019 mars. All rights reserved.
//

import UIKit



@objc protocol WaterfallLayoutDataSource : class {
    func waterfallLayout(_ layout : WaterfallLayout , indexPath:IndexPath) -> CGFloat
    
    @objc optional func numberOfColsInWaterfallLayout (_ layout : WaterfallLayout) -> Int
}


class WaterfallLayout: UICollectionViewFlowLayout {
    
    /// 代理数据源
    weak var dataSource : WaterfallLayoutDataSource?
    
    /// 布局属性数组
    private  lazy var attrsArray : [UICollectionViewLayoutAttributes] = [UICollectionViewLayoutAttributes]()
    //每一列的高度累计
    lazy var colHeights:[CGFloat] = {
        let cols = self.dataSource?.numberOfColsInWaterfallLayout?(self) ?? 2
        var colHeights = Array(repeating: self.sectionInset.top, count: cols)
        
        return colHeights
    }()
    // 最高的高度
    private var maxH : CGFloat = 0
    
    //索引
    private var startIndex:Int = 0
}


extension WaterfallLayout {
    override func prepare() {
        super.prepare()
        let itemCount = collectionView?.numberOfItems(inSection: 0) ?? 0
        let cols  = dataSource?.numberOfColsInWaterfallLayout?(self) ?? 2
        
        let width = ((collectionView?.bounds.width)! - self.sectionInset.left - self.sectionInset.right - self.minimumInteritemSpacing * CGFloat(cols - 1))
        
        let itemWidth = width / CGFloat(cols)
 
        for i in Int(startIndex) ..< itemCount{

            let indexPath = IndexPath(item: i, section: 0)
            let attrs = UICollectionViewLayoutAttributes(forCellWith: indexPath)
           guard let height = dataSource?.waterfallLayout(self, indexPath: indexPath) else {
                fatalError("请设置数据源")
            }
            
        let index = i % cols
            var colH = colHeights[index]
            colH = colH + height + minimumInteritemSpacing
            
            colHeights[i % cols] = colH
            
            attrs.frame = CGRect(x: self.sectionInset.left + (self.minimumInteritemSpacing + itemWidth) * CGFloat(index), y:colH - height - self.minimumInteritemSpacing , width: itemWidth, height: height)
            
            attrsArray.append(attrs)
        }

        maxH = colHeights.max()!
        startIndex = itemCount
        
    }
}


extension WaterfallLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attrsArray
    }
    override var collectionViewContentSize: CGSize {
        return CGSize(width: 0, height: maxH + sectionInset.bottom - minimumLineSpacing)
    }
}
