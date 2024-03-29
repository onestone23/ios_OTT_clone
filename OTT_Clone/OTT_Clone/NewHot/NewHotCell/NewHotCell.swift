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
        baseView.backgroundColor = .black
        return baseView
    }()
    
    var movieContainerView: UIView = {
        let movieView = UIView()
        movieView.translatesAutoresizingMaskIntoConstraints = false
        movieView.backgroundColor = .black
        return movieView
    }()
    
    var thumbnail: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "photo")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "photo")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    var player = AVPlayer()
    var playerLayer = AVPlayerLayer()
    
    var movieResult: MovieResult? {
        didSet {
            settingPlayerURL()
            settingDate()
            settingTitle()
            settingDescription()
            requestThumbnailImage()
            requestCoverImage()
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .black
        self.contentView.addSubview(baseContainerView)
        baseContainerView.addSubview(movieContainerView)
        baseContainerView.addSubview(thumbnail)
        baseContainerView.addSubview(dateLabel)
        baseContainerView.addSubview(titleLabel)
        baseContainerView.addSubview(descriptionLabel)
        addBaseView()
        addMovieView()
        addMovieLayer()
        addThumbnail()
        addDateLabel()
        addTitleLabel()
        addDescriptionLabel()
        addCoverImageWithSetAnchor()
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
    
    func moviePlay() {
        if self.player.timeControlStatus != .playing {
            self.player.play()
            coverImageView.isHidden = true
        }
    }
    
    func moviewStop() {
        self.player.pause()
        
        if self.player.currentTime().seconds > 1 {
            coverImageView.isHidden = true
        } else {
            coverImageView.isHidden = false
        }
        
    }
    
    private func requestCoverImage() {
        if let hasURL = movieResult?.artworkUrl {
            NetworkLayer.request(urlString: hasURL) { image in
                DispatchQueue.main.async {
                    self.coverImageView.image = image
                }
            }
            
        }
    }
    
    private func requestThumbnailImage() {
        if let hasURL = movieResult?.artworkUrl {
            NetworkLayer.request(urlString: hasURL) { image in
                DispatchQueue.main.async {
                    self.thumbnail.image = image
                }
            }
            
        }
    }
    
    private func settingPlayerURL() {
        if let previewURL = movieResult?.previewUrl,
           let hasURL = URL(string: previewURL) {
            self.player = AVPlayer(url: hasURL)
            self.playerLayer.player = player
            self.player.volume = 0
            self.player.play()
        }
    }
    
    private func settingDate() {
        if let hasDate = movieResult?.releaseDate {
            let formatter = ISO8601DateFormatter()
            
            if let isoDate = formatter.date(from: hasDate) {
                let myFormatter = DateFormatter()
                myFormatter.dateFormat = "yyyy-MM-dd"
                let dateString = myFormatter.string(from: isoDate)
                
                self.dateLabel.text = dateString
            }
        }
    }
    
    private func settingTitle() {
        self.titleLabel.text = movieResult?.trackName
    }
    
    private func settingDescription() {
        self.descriptionLabel.text = movieResult?.shortDescription
    }
    
    private func addBaseView() {
        NSLayoutConstraint.activate([
            baseContainerView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 50),
            baseContainerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            baseContainerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            baseContainerView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor)
        ])
    }

    private func addMovieView() {
        NSLayoutConstraint.activate([
            movieContainerView.topAnchor.constraint(equalTo: baseContainerView.topAnchor),
            movieContainerView.leftAnchor.constraint(equalTo: baseContainerView.leftAnchor),
            movieContainerView.rightAnchor.constraint(equalTo: baseContainerView.rightAnchor),
            movieContainerView.heightAnchor.constraint(equalToConstant: 200),
            movieContainerView.bottomAnchor.constraint(equalTo: thumbnail.topAnchor, constant: -10),
            
        ])
    }
    
    private func addCoverImageWithSetAnchor() {
        movieContainerView.addSubview(coverImageView)
        
        NSLayoutConstraint.activate([
            coverImageView.leftAnchor.constraint(equalTo: movieContainerView.leftAnchor),
            coverImageView.rightAnchor.constraint(equalTo: movieContainerView.rightAnchor),
            coverImageView.topAnchor.constraint(equalTo: movieContainerView.topAnchor),
            coverImageView.bottomAnchor.constraint(equalTo: movieContainerView.bottomAnchor),
        ])
    }
    
    private func addMovieLayer() {
        movieContainerView.layer.addSublayer(playerLayer)
        let width = UIScreen.main.bounds.width - 50
        let height = (width / 16) * 9
        playerLayer.frame = CGRect(x: 0, y: 0, width: width, height: height)
    }
    
    private func addThumbnail() {
        NSLayoutConstraint.activate([
            thumbnail.leftAnchor.constraint(equalTo: baseContainerView.leftAnchor),
            thumbnail.heightAnchor.constraint(equalToConstant: 80),
            thumbnail.widthAnchor.constraint(equalToConstant: 50),
            thumbnail.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: -10),
        ])
    }
    
    private func addDateLabel() {
        NSLayoutConstraint.activate([
            dateLabel.leftAnchor.constraint(equalTo: baseContainerView.leftAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -10),
        ])
    }
    
    private func addTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: baseContainerView.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: baseContainerView.rightAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -10)
        ])
    }
    
    private func addDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.leftAnchor.constraint(equalTo: baseContainerView.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: baseContainerView.rightAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: baseContainerView.bottomAnchor, constant: -30)
        ])
    }
}

