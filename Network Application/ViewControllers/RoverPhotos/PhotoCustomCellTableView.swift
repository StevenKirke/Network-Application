//
//  PhotoCustomCellTableView.swift
//  Network Application
//
//  Created by Steven Kirke on 21.09.2020.
//

import UIKit

class PhotoCustomCellTableView: UITableViewCell {
    
    var imageUrl: String?
    var cacheService: UrlCacheService?
    
    @IBOutlet weak var photoRoversImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roverNameLabel: UILabel!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var cameraLabel: UILabel!
    
    func loadImage(imageUrl: String) {
        photoRoversImage.image = nil
        loader.startAnimating()
        cacheService = UrlCacheService()
        self.imageUrl = imageUrl
        cacheService?.getImage(urlString: imageUrl) { [weak self, imageUrl] image in
            guard let self = self, let image = image else {
                return
            }
            if imageUrl == self.imageUrl {
                self.photoRoversImage.image = image
                self.loader.stopAnimating()
            }
        }
        
    }

}
