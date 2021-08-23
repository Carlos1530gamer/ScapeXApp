//
//  LaunchesModel.swift
//  ScpaceXApp
//
//  Created by Carlos Daniel Hernandez on 22/08/21.
//

import Foundation

struct LaunchesResponse: Decodable {
    let launches: [Launches]
}

struct Launches: Decodable {
    let id: String
    let missionName: String
    let missionId: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case missionName = "mission_name"
        case missionId = "mission_id"
    }
}
