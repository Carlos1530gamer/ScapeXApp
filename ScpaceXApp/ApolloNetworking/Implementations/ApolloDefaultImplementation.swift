//
//  ApolloDefaultImplementation.swift
//  ScpaceXApp
//
//  Created by Carlos Daniel Hernandez on 21/08/21.
//

import Foundation
import RxSwift
import Apollo

struct ApolloDefaultImplementation: ApolloNetworkingProtocol {
    var apolloClient: ApolloClient
    
    init(apolloStore: ApolloStore = ApolloStore(cache: InMemoryNormalizedCache()),
         provider: InterceptorProvider = AppDefaultInterceptorProvider()) {
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: EnviromentVariables.baseApi)
        self.apolloClient = ApolloClient(networkTransport: requestChainTransport,
                                         store: apolloStore)
    }
}
