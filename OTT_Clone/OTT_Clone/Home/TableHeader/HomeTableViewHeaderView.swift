//
//  HomeTableViewHeaderView.swift
//  OTT_Clone
//
//  Created by leewonseok on 2023/03/10.
//

import UIKit

class HomeTableViewHeaderView: UITableViewHeaderFooterView {
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
        ])
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
