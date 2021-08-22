//
//  EnviromentVariables.swift
//  ScpaceXApp
//
//  Created by Carlos Daniel Hernandez on 21/08/21.
//

import Foundation

// in future add build to secret file to CI and CD
enum EnviromentVariables {
    static let baseApi: URL = URL(string: "https://api.spacex.land/graphql/")!
}
