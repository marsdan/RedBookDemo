//
//  RootTabBarViewController.swift
//  RedBook
//
//  Created by peng zhao on 2019/4/22.
//  Copyright © 2019 mars. All rights reserved.
//

import UIKit

class RootTabBarViewController: UITabBarController {

    var zpTabBar:RootTabBar!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initViewControllers()
       
        self.zpTabBar = RootTabBar.init(frame:CGRect.zero)
        self .setValue(self.zpTabBar, forKey: "tabBar")
//        self.zpTabBar.centerBtn.reactive.controlEvents(.touchUpInside).observeValues { (btn) in
//            print("点击了中间")
//        }
        self.selectedIndex = 1
        self.selectedIndex = 0
        
        let  NVC = self.viewControllers?[2]
        NVC?.tabBarItem.badgeValue = "123";
        
    }
    
    private func initViewControllers (){
        let titleName:NSArray = ["首页","商城","消息","我"]
        
        let classArray = [RBHomePageViewController(),
                          UIViewController(),
                          UIViewController(),
                          UIViewController()]
        
     
        
        let VCArray: NSMutableArray =  NSMutableArray.init()
        
        titleName.enumerateObjects { (obj, index, stop) in
            
            let VC = classArray[index]

            VC.title = obj as? String
           

            let NAVC = UINavigationController.init(rootViewController: VC)
            VCArray.add(NAVC)
            
            
        }
        self.viewControllers = VCArray as? [UIViewController]
        
        UITabBarItem.appearance().setTitleTextAttributes([
            .foregroundColor:UIColor(red:0.15, green:0.13, blue:0.15, alpha:1.00)
            ], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([
            .foregroundColor:UIColor(red:0.61, green:0.60, blue:0.62, alpha:1.00)
            ], for: .normal)
        
        
        UITabBarItem.appearance().setTitleTextAttributes([
            .font:UIFont.systemFont(ofSize: 18, weight: .medium)
            ], for: .normal)
        
//        UITabBarItem.appearance().setTitleTextAttributes([
//            .font:UIFont.systemFont(ofSize: 16, weight: .regular)
//            ], for: .normal)
        
        
        
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -12)
        
        
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
