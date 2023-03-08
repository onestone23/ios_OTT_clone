//
//  HomeNaviViewController.swift
//  OTT_Clone
//
//  Created by leewonseok on 2023/03/07.
//

import UIKit

class HomeNaviViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundEffect = UIBlurEffect(style: .dark)

        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        self.navigationBar.compactScrollEdgeAppearance = appearance
        
        let logo = UIImage(named: "netflix_logo")
        
        let logoButton = UIButton()
        logoButton.setImage(logo, for: .normal)
        logoButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    }
    
}
