//
//  ApolloClient+RxSwift.swift
//  ScpaceXApp
//
//  Created by Carlos Daniel Hernandez on 22/08/21.
//

import Foundation
import RxSwift
import Apollo

extension ApolloClient {
    func fetch<Query: GraphQLQuery>(query: Query,
                                    cachePolicy: CachePolicy = .default,
                                    contextIdentifier: UUID? = nil,
                                    queue: DispatchQueue = .main) -> Single<GraphQLResult<Query.Data>> {
        Single<GraphQLResult<Query.Data>>.create(subscribe: {[weak self] single in
            let disposables = Disposables.create()
            guard let self = self else { return disposables }
            
            self.fetch(query: query,
                       cachePolicy: cachePolicy,
                       contextIdentifier: contextIdentifier,
                       queue: queue) { result in
                single(result)
            }
            
            return disposables
        })
    }
}
