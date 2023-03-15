//
//  DetailViewController.swift
//  OTT_Clone
//
//  Created by leewonseok on 2023/03/15.
//

import UIKit
import AVKit

class DetailViewController: UIViewController {
    private var loadedViewAndDateSet: (() -> Void)?
    
    var movieResult: MovieResult? {
        didSet {
            loadedViewAndDateSet = { [weak self] in
                self?.movieDescription.text = self?.movieResult?.longDescription
                self?.movieTitle.text = self?.movieResult?.trackName
                if let previewUrl = self?.movieResult?.previewUrl, let url = URL(string:previewUrl) {
                    self?.playMovie(url: url)
                }
            }
        }
    }

    @IBOutlet weak var movieContainerView: UIView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    private var player = AVPlayer()
    private var playerLayer = AVPlayerLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadedViewAndDateSet?()
        movieContainerView.layer.addSublayer(playerLayer)
        
        playerLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300)
        
        
    }
    func playMovie(url: URL) {
        player = AVPlayer(url: url)
        playerLayer.player = player
        player.volume = 0
        player.play()
    }
    
    @IBAction func play(_ sender: UIButton) {
        if player.timeControlStatus != .playing {
            player.play()
        }
    }
    
    @IBAction func stop(_ sender: UIButton) {
        player.pause()
    }

}
