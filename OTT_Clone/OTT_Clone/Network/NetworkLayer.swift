//
//  NetworkLayer.swift
//  OTT_Clone
//
//  Created by leewonseok on 2023/03/10.
//

import Foundation

class NetworkLayer {
    
    static func request() {
        let term = URLQueryItem(name: "term", value: "movie")
        let media = URLQueryItem(name: "media", value: "movie")
        
        let querys = [term, media]
        
        var components = URLComponents(string: "https://itunes.apple.com/search?media=movie&term=")
        
        components?.queryItems = querys
        
        guard let hasUrl = components?.url else {
            return
        }
        
        URLSession.shared.dataTask(with: hasUrl) { data, response, error in
            if let data {
                do {
                    let movieModel = try JSONDecoder().decode(MovieModel.self, from: data)
                    print(movieModel)
                } catch {
                    print("decode Error: ",error)
                }
                
                
            }
        }.resume()
    }
}
