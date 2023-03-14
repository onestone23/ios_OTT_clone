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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(NewHotCell.self, forCellReuseIdentifier: "NewHotCell")
        
        NetworkLayer.request(type: .movie) { model in
            self.movieModel = model
        }
    }
}

extension NewHotViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieModel?.resultCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewHotCell", for: indexPath) as? NewHotCell else {
            return NewHotCell()
        }
        
        let movieResult = self.movieModel?.results[indexPath.row]
        cell.movieResult = movieResult
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
