//
//  NewHotCell.swift
//  OTT_Clone
//
//  Created by leewonseok on 2023/03/13.
//

import UIKit
import AVKit

class NewHotCell: UITableViewCell {

    var baseContainerView: UIView = {
        let baseView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.backgroundColor = .yellow
        return baseView
    }()
    
    var moviewContainerView: UIView = {
        let movieView = UIView()
        movieView.translatesAutoresizingMaskIntoConstraints = false
        movieView.backgroundColor = .gray
        return movieView
    }()
    
    var thumbnail: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var player = AVPlayer()
    var playerLayer = AVPlayerLayer()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addBaseView()
        addMovieView()
        addMovieLayer()
        addThumbnail()
        addDateLabel()
        addTitleLabel()
        addDescriptionLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func addBaseView() {
        self.contentView.addSubview(baseContainerView)
        
        NSLayoutConstraint.activate([
            baseContainerView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 50),
            baseContainerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            baseContainerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            baseContainerView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor)
        ])
    }

    private func addMovieView() {
        baseContainerView.addSubview(moviewContainerView)
        
        NSLayoutConstraint.activate([
            moviewContainerView.topAnchor.constraint(equalTo: baseContainerView.topAnchor),
            moviewContainerView.leftAnchor.constraint(equalTo: baseContainerView.leftAnchor),
            moviewContainerView.rightAnchor.constraint(equalTo: baseContainerView.rightAnchor),
            moviewContainerView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    private func addMovieLayer() {
        moviewContainerView.layer.addSublayer(playerLayer)
        let width = UIScreen.main.bounds.width - 50
        let height = (width / 16) * 9
        playerLayer.frame = CGRect(x: 0, y: 0, width: width, height: height)
    }
    
    private func addThumbnail() {
        baseContainerView.addSubview(thumbnail)
        
        NSLayoutConstraint.activate([
            thumbnail.topAnchor.constraint(equalTo: moviewContainerView.bottomAnchor, constant: 10),
            thumbnail.leftAnchor.constraint(equalTo: baseContainerView.leftAnchor),
            thumbnail.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    private func addDateLabel() {
        baseContainerView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: thumbnail.bottomAnchor, constant: 10),
            dateLabel.leftAnchor.constraint(equalTo: baseContainerView.leftAnchor),
        ])
        
    }
    
    private func addTitleLabel() {
        baseContainerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            titleLabel.leftAnchor.constraint(equalTo: baseContainerView.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: baseContainerView.rightAnchor, constant: -20),
        ])
        
    }
    
    private func addDescriptionLabel() {
        baseContainerView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionLabel.leftAnchor.constraint(equalTo: baseContainerView.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: baseContainerView.rightAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: baseContainerView.bottomAnchor, constant: -30)
        ])
    }
}

