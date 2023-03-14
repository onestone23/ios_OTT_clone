//
//  NewHotViewController.swift
//  OTT_Clone
//
//  Created by leewonseok on 2023/03/07.
//

import UIKit

class NewHotViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var movieModel: MovieModel? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.text = "NEW & HOT"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .lightGray
        self.navigationItem.titleView = label
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(NewHotCell.self, forCellReuseIdentifier: "NewHotCell")
        tableView.register(DateHeaderView.self, forHeaderFooterViewReuseIdentifier: "DateHeaderView")
        tableView.backgroundColor = .black
        NetworkLayer.request(type: .movie) { model in
            self.movieModel = model
        }
    }
}

extension NewHotViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return movieModel?.resultCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewHotCell", for: indexPath) as? NewHotCell else {
            return NewHotCell()
        }
        
        let movieResult = self.movieModel?.results[indexPath.section]
        cell.movieResult = movieResult
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "DateHeaderView")
                as? DateHeaderView else {
            return DateHeaderView()
        }
        
        if let dateString = movieModel?.results[section].releaseDate {
            let formatter = ISO8601DateFormatter()
            
            if let date = formatter.date(from: dateString) {
                let myFormatter = DateFormatter()
                myFormatter.dateFormat = "M월\ndd"
                
                let dateString = myFormatter.string(from: date)
                let attributedString = NSMutableAttributedString(string: dateString)
                let monthRange = NSRange(location: 0, length: dateString.count - 2)
                let dayRange = NSRange(location: dateString.count - 2, length: 2)
                
                attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 14), range: monthRange)
                attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: dayRange)
                attributedString.addAttribute(.foregroundColor, value: UIColor.lightGray, range: monthRange)
                attributedString.addAttribute(.foregroundColor, value: UIColor.white, range: dayRange)
                headerView.dateAttributeString = attributedString
            }
            
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}


extension NewHotViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let visibleCells = tableView.visibleCells as? [NewHotCell] else { return }
        
        guard let firstCell = visibleCells.first else { return }
        
        if visibleCells.count == 1 {
            firstCell.moviePlay()
            return
        }
        
        let secondCell = visibleCells[1]
        
        // position convert
        let firstCellPositionY = tableView.convert(firstCell.frame.origin, to: self.view).y
        let secondCellPositionY = tableView.convert(secondCell.frame.origin, to: self.view).y
        
        if firstCellPositionY > 50 {
            firstCell.moviePlay()
            
            var otherCells = visibleCells
            otherCells.removeFirst()
            otherCells.forEach { cell in
                cell.moviewStop()
            }
        } else {
            secondCell.moviePlay()
            
            var otherCells = visibleCells
            otherCells.remove(at: 1)
            otherCells.forEach { cell in
                cell.moviewStop()
            }
        }
        
        
    }
}
