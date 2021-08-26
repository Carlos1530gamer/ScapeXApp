//
//  ApolloClient+RxSwift.swift
//  ScpaceXApp
//
//  Created by Carlos Daniel Hernandez on 22/08/21.
//

import Foundation
import RxSwift
import Apollo

enum RxSwiftApolloClientError: Error {
    case conontGetData
    case cantConvertToData
    case parseError
}

private typealias Errors = RxSwiftApolloClientError

extension ApolloClient {
    func fetch<Query: GraphQLQuery, Model: Decodable>(query: Query,
                                                      modeltype: Model.Type,
                                                      cachePolicy: CachePolicy = .default,
                                                      contextIdentifier: UUID? = nil,
                                                      queue: DispatchQueue = .main) -> Single<Model> {
        Single<Model>.create(subscribe: {[weak self] single in
            let disposables = Disposables.create()
            guard let self = self else { return disposables }
            
            self.fetch(query: query,
                       cachePolicy: cachePolicy,
                       contextIdentifier: contextIdentifier,
                       queue: queue) { result in
                switch result {
                case .success(let data):
                    guard let dicData = data.data?.resultMap else {
                        single(.failure(Errors.conontGetData))
                        return
                    }
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: dicData) else {
                        single(.failure(Errors.cantConvertToData))
                        return
                    }
                    
                    do {
                        let model = try JSONDecoder().decode(modeltype, from: jsonData)
                        single(.success(model))
                    } catch let error {
                        Log.logParseError(error)
                        single(.failure(error))
                    }
                    
                case .failure(let error):
                    single(.failure(error))
                }
            }
            
            return disposables
        })
    }
}
