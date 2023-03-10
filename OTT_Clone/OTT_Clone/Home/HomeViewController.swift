//
//  HomeViewController.swift
//  OTT_Clone
//
//  Created by leewonseok on 2023/03/07.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headerView = HomeTableHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 400))
        
        // 헤더 뷰를 만약 스테이터스 바까지 사용하고싶다면 TableView 인스펙터 창의 content inset - never ( 스토리 보드 )
        // 코드로 할 때
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.tableHeaderView = headerView
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let area: CGFloat = 100
        let alpha = min(1, scrollView.contentOffset.y / area)
        if let homeNavi =  self.navigationController as? HomeNaviViewController {
            homeNavi.effectViewAlpha = alpha
        }
    }
}
