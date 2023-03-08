//
//  MainTabBarViewController.swift
//  OTT_Clone
//
//  Created by leewonseok on 2023/03/07.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // let homeVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController

        let newHotVC = UIStoryboard(name: "NewHot", bundle: nil).instantiateViewController(withIdentifier: "NewHotViewController") as! NewHotViewController
        
        let homeNaviVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeNaviViewController") as! HomeNaviViewController
        
        homeNaviVC.tabBarItem.title = "HOME"
        homeNaviVC.tabBarItem.image = UIImage(systemName: "house")
        
        newHotVC.tabBarItem.title = "NEW & HOT"
        newHotVC.tabBarItem.image = UIImage(systemName: "play.rectangle.on.rectangle")
        
        self.viewControllers = [homeNaviVC, newHotVC]
        
        // 탭바에 대한 설정
        let tabBarAppeaarance = UITabBarAppearance()
        tabBarAppeaarance.backgroundColor = .black
        // 아래 설정으로 블러같은 이펙트도 줄 수 있음
        // tabBarAppeaarance.backgroundEffect
        
        // 탭바 아이템에 대한 설정
        let tabBarItemAppearance = UITabBarItemAppearance()
        tabBarItemAppearance.normal.iconColor = .darkGray
        tabBarItemAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.darkGray]
        tabBarItemAppearance.selected.iconColor = .white
        tabBarItemAppearance.selected.titleTextAttributes = [.foregroundColor : UIColor.white]
        
        // 탭바 설정에 탭바 아이템 설정
        tabBarAppeaarance.stackedLayoutAppearance = tabBarItemAppearance
        tabBarAppeaarance.inlineLayoutAppearance = tabBarItemAppearance
        tabBarAppeaarance.compactInlineLayoutAppearance = tabBarItemAppearance
        
        // 탭바에 탭바 설정
        self.tabBar.standardAppearance = tabBarAppeaarance
        self.tabBar.scrollEdgeAppearance = tabBarAppeaarance
        
    }
}
