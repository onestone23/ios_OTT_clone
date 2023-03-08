//
//  HomeNaviViewController.swift
//  OTT_Clone
//
//  Created by leewonseok on 2023/03/07.
//

import UIKit

class HomeNaviViewController: UINavigationController {
    // 상단 스테이터스바 크기(높이)
    let statusBarHeight = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.statusBarManager?.statusBarFrame.height ?? 0

    lazy var visuallEffectView: UIVisualEffectView = {
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        // 지정된 크기보다 더 지정하는 방법
        effectView.frame = self.navigationBar.bounds.insetBy(dx: 0, dy: -statusBarHeight).offsetBy(dx: 0, dy: -statusBarHeight)
        return effectView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        // 블러처리
        // appearance.backgroundEffect = UIBlurEffect(style: .dark)
        appearance.configureWithTransparentBackground()

        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        self.navigationBar.compactScrollEdgeAppearance = appearance
        
        let logo = UIImage(named: "netflix_logo")
        
        let logoButton = UIButton()
        logoButton.setImage(logo, for: .normal)
        // 네비게이션 바에 올라가는 요소는 오토레이아웃 설정이 불가하여 프레임 설정
        logoButton.frame = CGRect(x: 10, y: 5, width: 30, height: 30)
        
        self.navigationBar.addSubview(visuallEffectView)
        self.navigationBar.addSubview(logoButton)
        
        // barButtonItem에 추가할 땐 오토레이아웃으로 설정 - 프레임 설정 불가
        // logoButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        // logoButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        // self.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(customView: logoButton)
        
    }
    
}
