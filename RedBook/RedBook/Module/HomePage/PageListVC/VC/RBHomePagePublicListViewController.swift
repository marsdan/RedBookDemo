//
//  RBHomePagePublicListViewController.swift
//  RedBook
//
//  Created by peng zhao on 2019/4/23.
//  Copyright © 2019 mars. All rights reserved.
//

import UIKit

class RBHomePagePublicListViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,WaterfallLayoutDataSource{
 
    
    lazy var viewModel:RBHomePageViewModel = {
        let viewModel = RBHomePageViewModel()
        return viewModel
    }()
    
    lazy var collectionView :UICollectionView = {
        
        let layout = WaterfallLayout()
        layout.sectionInset =  UIEdgeInsets(top: 6, left: 6, bottom: 0, right: 6)
        layout.minimumInteritemSpacing = 6
        layout.minimumLineSpacing = 6
        layout.dataSource = self
        
        let collectionView = UICollectionView.init(frame:self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.00)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
       return collectionView
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionView.frame = self.view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.collectionView)
        
        self.collectionView.register(RBHomePageItemCollectionViewCell.self, forCellWithReuseIdentifier: "RBHomePageItemCollectionViewCell")
        
        getDate()
    }
    
    func getDate() {
        MLog("开始请求")
        self.viewModel.upDateWithType(type: .Discovery) {
            MLog("获取成功")
            self.collectionView.reloadData()
        }
        
         
        
    }
    
    
    // MARK: - UICollectionViewDataSource
    
    /// 返回组数
    ///
    /// - Parameter collectionView:
    /// - Returns: 组数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /// 每组cell数量
    ///
    /// - Parameters:
    ///   - collectionView:
    ///   - section:
    /// - Returns:
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.dataArray.count
    }
    
    /// 显示cell
    ///
    /// - Parameters:
    ///   - collectionView:
    ///   - indexPath:
    /// - Returns:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RBHomePageItemCollectionViewCell", for: indexPath) as! RBHomePageItemCollectionViewCell
        
        cell.setViewModel(viewModel: self.viewModel.dataArray[indexPath.row])
       
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    /// 每个cell的尺寸
    ///
    /// - Parameters:
    ///   - collectionView:
    ///   - collectionViewLayout:
    ///   - indexPath:
    /// - Returns:
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width:  self.viewModel.dataArray[indexPath.row].cellWidth, height:  self.viewModel.dataArray[indexPath.row].cellHeight)
//    }
    
 // MARK: - WaterfallLayoutDataSource
    
    func waterfallLayout(_ layout: WaterfallLayout, indexPath: IndexPath) -> CGFloat {
        return  self.viewModel.dataArray[indexPath.row].cellHeight
    }
    func numberOfColsInWaterfallLayout(_ layout: WaterfallLayout) -> Int {
        return 2
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
