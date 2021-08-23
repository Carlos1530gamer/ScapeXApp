//
//  LaunchesInteractor.swift
//  ScpaceXApp
//
//  Created by Carlos Daniel Hernandez on 22/08/21.
//

import Foundation
import RxSwift

final class LaunchesInteractor: LaunchesInteractorProtocol {
    private let repository: ApolloDefaultImplementation = .init()
    
    func getLaunchesData() -> Single<[Launches]> {
        repository
            .apolloClient
            .fetch(query: LaunchesQuery(),
                   modeltype: LaunchesResponse.self)
            .map({ $0.launches })
    }
}
