//
//  UrlCacheService.swift
//  Network Application
//
//  Created by Steven Kirke on 23.09.2020.
//

import UIKit

class UrlCacheService {
    static var queue = DispatchQueue(label: "cache")
    private static var cacheImages = [String: UIImage]()
    
    func getImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        if let image = UrlCacheService.cacheImages[urlString] {
            completion(image)
            return
        }
        UrlCacheService.queue.async {
            guard let url = URL(string: urlString),
                  let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            DispatchQueue.main.async {
                UrlCacheService.cacheImages[urlString] = image
                completion(image)
            }
        }
    }
}
