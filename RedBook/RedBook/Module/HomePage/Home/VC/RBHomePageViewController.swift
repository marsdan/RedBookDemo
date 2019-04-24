//
//  RBHomePageViewController.swift
//  RedBook
//
//  Created by peng zhao on 2019/4/22.
//  Copyright © 2019 mars. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class RBHomePageViewController: WMPageController {
    
    var categorys:[NSString] = []
    var classArray:[UIViewController]  = []
    var searchView:RBHomePageSearchView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated:false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.menuViewStyle = .line
        self.titleSizeSelected = 18
        self.titleSizeNormal = 16
        self.pageAnimatable = false
        self.preloadPolicy = .neighbour
        self.progressColor = UIColor.red
        self.titleColorSelected = UIColor("#000000")
        self.titleColorNormal = UIColor("#9B9B9B")
        self.menuItemWidth = 50
        self.progressHeight = 2
        self.progressWidth = 30
        
        self.progressViewBottomSpace = 4
        self.progressViewCornerRadius = 2
        categorys = ["关注","发现","附近"];
        classArray = [UIViewController(),RBHomePagePublicListViewController(),UIViewController()]
        self.reloadData()
        self.selectIndex = 1
        
        self.searchView = RBHomePageSearchView.init(frame: CGRect.init(x: 0, y: (kHeightStatusBar + kHeightNavContentBar), width: kScreenWidth, height: 40))
        self.view.addSubview(self.searchView)
        
        
        
        self.searchView.titleBtn.reactive.controlEvents(.touchUpInside).observeValues { (btn) in
            print("跳转到搜索页面")
            let VC = RBHomePageSearchViewController()

            self.present(VC, animated: false, completion: {
                
            })
            
        }
        
    }
    
    
    override func pageController(_ pageController: WMPageController, preferredFrameFor menuView: WMMenuView) -> CGRect {
        return CGRect.init(x: (kScreenWidth-200)/2.0, y: kHeightStatusBar, width: 200, height: kHeightNavContentBar)
    }
    
    override func pageController(_ pageController: WMPageController, preferredFrameForContentView contentView: WMScrollView) -> CGRect {
        var view_Y = kHeightStatusBar
        view_Y += kHeightNavContentBar
        view_Y += 50
        var view_H = kScreenHeight
        view_H -= view_Y
        view_H -= kHeight_TabBar
        
        return CGRect.init(x: 0, y: view_Y, width: kScreenWidth, height:view_H)
    }
    
    override  func numbersOfChildControllers(in pageController: WMPageController) -> Int {
        return self.categorys.count
    }
    
    override func pageController(_ pageController: WMPageController, viewControllerAt index: Int) -> UIViewController {
        return self.classArray[index]
    }
    
    override func pageController(_ pageController: WMPageController, titleAt index: Int) -> String {
        return self.categorys[index] as String
    }
}
