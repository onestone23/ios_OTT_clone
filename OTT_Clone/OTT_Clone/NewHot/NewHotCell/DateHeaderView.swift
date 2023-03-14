//
//  DateHeaderView.swift
//  OTT_Clone
//
//  Created by leewonseok on 2023/03/14.
//

import UIKit

class DateHeaderView: UITableViewHeaderFooterView {
    var dateAttributeString: NSMutableAttributedString? {
        didSet {
            dateLabel.attributedText = dateAttributeString
        }
    }
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.backgroundColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(dateLabel)
//        self.contentView.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            dateLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 50),
            dateLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
