//
//  MarsRoverService.swift
//  Network Application
//
//  Created by Steven Kirke on 21.09.2020.
//

import Foundation

class MarsRoverService {
    
    init() {
        print("Init service")
    }
    
    deinit {
        print("Deinit service")
    }
    
    static let apiKey = "kiZ2bTciOh0t7SHS3A4NA4oO9bnQkU4uHYe7nKR3"
    
    func getPhotos(rover: RoverType,
                   sol: Int? = nil,
                   camera: RoverCameraType? = nil,
                   page: Int = 1,
                   completion: @escaping (_: RoverPhotos?, _: Error?) -> Void ) {
        guard let url = URL(string: rover.urlString) else {
            completion(nil, RoverError.wrongUrl)
            return
        }
        var params = [URLQueryItem]()
        if let sol = sol {
            params.append(URLQueryItem(name: "sol", value: "\(sol)"))
        }
        if let camera = camera {
            params.append(URLQueryItem(name: "camera", value: camera.rawValue))
        }
        params.append(URLQueryItem(name: "page", value: "\(page)"))
        params.append(URLQueryItem(name: "api_key", value: MarsRoverService.apiKey))
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = params
        
        guard let newUrl = urlComponents?.url else {
            completion(nil, RoverError.wrongUrl)
            return
        }
        print(newUrl.absoluteString)
        let request = URLRequest(url: newUrl)
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { (data, response, error) in
            //print(String(data: data!, encoding: .utf8))
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil, error)
                    return
                }
                let decoder = JSONDecoder()
                if let data = data, let result = try? decoder.decode(RoverPhotos.self, from: data) {
                    completion(result, nil)
                } else {
                    completion(nil, RoverError.parseError)
                }
            }
        }
        task.resume()
    }
}



