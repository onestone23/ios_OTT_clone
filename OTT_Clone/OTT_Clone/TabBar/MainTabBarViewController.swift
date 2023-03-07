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
        
        let homeVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController

        let newHotVC = UIStoryboard(name: "NewHot", bundle: nil).instantiateViewController(withIdentifier: "NewHotViewController") as! NewHotViewController
        
        homeVC.tabBarItem.title = "HOME"
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        
        newHotVC.tabBarItem.title = "NEW & HOT"
        newHotVC.tabBarItem.image = UIImage(systemName: "play.rectangle.on.rectangle")
        
        self.viewControllers = [homeVC, newHotVC]
        
        // 탭바에 대한 설정
        let tabBarAppeaarance = UITabBarAppearance()
        tabBarAppeaarance.backgroundColor = .black
        
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
