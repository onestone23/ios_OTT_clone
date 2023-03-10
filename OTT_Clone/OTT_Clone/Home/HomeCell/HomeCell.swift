//
//  HomeCell.swift
//  OTT_Clone
//
//  Created by leewonseok on 2023/03/10.
//

import UIKit

class HomeCell: UITableViewCell {
 
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movieModel: MovieModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        collectionView.collectionViewLayout = flowLayout
        
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
    }
    
    func requestMediaAPI(type: MediaType?) {
        if let type {
            NetworkLayer.request(type: type) { model in
                self.movieModel = model
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
extension HomeCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 130)
    }
}

extension HomeCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieModel?.resultCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else {
            return HomeCollectionViewCell()
        }
        
        if let hasUrl = self.movieModel?.results[indexPath.item].artworkUrl {
            NetworkLayer.request(urlString: hasUrl) { image in
                DispatchQueue.main.async {
                    cell.coverImageView.image = image
                }
            }
        }
        return cell
    }
}
