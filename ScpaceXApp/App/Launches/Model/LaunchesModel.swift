//
//  LaunchesModel.swift
//  ScpaceXApp
//
//  Created by Carlos Daniel Hernandez on 22/08/21.
//

import Foundation

struct LaunchesResponse: Decodable {
    let launches: [Launch]
    
    enum CodingKeys: String, CodingKey {
        case launches = "launchesPast"
    }
}

struct Launch: Decodable {
    let id: String
    let missionName: String
    let missionId: [String]
    let details: String?
    let rocket: LaunchRocket
    let links: LaunchLinks
    
    enum CodingKeys: String, CodingKey {
        case id, details, rocket, links
        case missionName = "mission_name"
        case missionId = "mission_id"
    }
    
    enum DecodeError: Error {
        case cantDecodeDate
    }
}

struct LaunchRocket: Decodable {
    let name: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case name = "rocket_name"
        case type = "rocket_type"
    }
}

struct LaunchLinks: Decodable {
    let missionPatch: URL?
    
    enum CodingKeys: String, CodingKey {
        case missionPatch = "mission_patch"
    }
}
