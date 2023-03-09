//
//  HomeTableHeaderView.swift
//  OTT_Clone
//
//  Created by leewonseok on 2023/03/08.
//

import UIKit

class HomeTableHeaderView: UIView {
    
    var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Top-Gun-Maverick"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
//    private func
}
