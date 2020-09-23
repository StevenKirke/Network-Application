//
//  RoverPhotos.swift
//  Network Application
//
//  Created by Steven Kirke on 21.09.2020.
//

import Foundation

struct RoverPhotos: Codable {
    let photos: [RoverPhoto]
}

// MARK: - Photo
struct RoverPhoto: Codable {
    let id, sol: Int
    let camera: RoverCamera
    let imgSrc: String
    let earthDate: String
    let rover: Rover

    enum CodingKeys: String, CodingKey {
        case id, sol, camera
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case rover
    }
}

// MARK: - Camera
struct RoverCamera: Codable {
    let id: Int
    let name: String
    let roverID: Int
    let fullName: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case roverID = "rover_id"
        case fullName = "full_name"
    }
}

// MARK: - Rover
struct Rover: Codable {
    let id: Int
    let name, landingDate, launchDate, status: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
    }
}


//CodingKey - переобразует landing_date -> landingDate
