//
//  ApolloNetworkingProtocol.swift
//  ScpaceXApp
//
//  Created by Carlos Daniel Hernandez on 21/08/21.
//

import Foundation
import Apollo
import ApolloAPI

protocol ApolloNetworkingProtocol {
    var apolloClient: ApolloClient { get }
}
