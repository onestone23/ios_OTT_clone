//
//  NetworkLayer.swift
//  OTT_Clone
//
//  Created by leewonseok on 2023/03/10.
//

import UIKit

class NetworkLayer {
    
    static func request(urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data {
                let image = UIImage(data: data)
                completion(image)
            }
        }.resume()
    }
    
    static func request(type: MediaType, completion: @escaping (MovieModel) -> Void) {
        let term = URLQueryItem(name: "term", value: type.queryValue)
        let media = URLQueryItem(name: "media", value: type.queryValue)
        
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
                    completion(movieModel)
                } catch {
                    print("decode Error: ",error)
                }
                
                
            }
        }.resume()
    }
}
