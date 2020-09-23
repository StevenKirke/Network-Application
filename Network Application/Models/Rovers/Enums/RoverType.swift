//
//  RoverType.swift
//  Network Application
//
//  Created by Steven Kirke on 21.09.2020.
//

import UIKit

enum RoverType: String, CaseIterable {
    case curiosity
    case opportunity
    case spirit
    
    var imageName: String {
        "rover_\(rawValue)"
    }
    
    var urlString: String {
        "https://api.nasa.gov/mars-photos/api/v1/rovers/\(self)/photos"
    }

}
// MARK: - UIKit component
extension RoverType {
    var image: UIImage? {
        return RoverType.images[self.rawValue]
    }
    private static let images: [String: UIImage] = RoverType.allCases
            .reduce([String: UIImage]()) {
            var dict = $0
            dict[$1.rawValue] = UIImage(named: $1.imageName)
            return dict
        }
}


