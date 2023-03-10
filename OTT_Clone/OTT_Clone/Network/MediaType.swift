//
//  MediaType.swift
//  OTT_Clone
//
//  Created by leewonseok on 2023/03/10.
//

import Foundation

enum MediaType: Int, CaseIterable {
    case movie
    case podcast
    case music
    case audiobook
    case musicVideo
    
    var queryValue: String {
        "\(self)"
    }
    
    var title: String {
        switch self {
        case .movie:
            return "영화"
        case .podcast:
            return "팟캐스트"
        case .music:
            return "뮤직"
        case .audiobook:
            return "오디오북"
        case .musicVideo:
            return "뮤직비디오"
        }
    }
}
