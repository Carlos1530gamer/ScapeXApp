//
//  AppDefaultInterceptorProvider.swift
//  ScpaceXApp
//
//  Created by Carlos Daniel Hernandez on 22/08/21.
//

import Apollo

struct AppDefaultInterceptorProvider: InterceptorProvider {
    func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation { [] }
}
