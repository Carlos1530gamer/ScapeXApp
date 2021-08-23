//
//  LaunchesProtocols.swift
//  ScpaceXApp
//
//  Created by Carlos Daniel Hernandez on 22/08/21.
//

import Foundation
import RxSwift

protocol LaunchesInteractorProtocol {
    func getLaunchesData() -> Single<[Launches]>
}

protocol LaunchesPresenterProtocol: LaunchesViewInputAndOutputProtocol {
    func showLaunchesModule()
}

protocol LaunchesRouterProtocol {
    func showLaunchesModule(presenter: LaunchesPresenterProtocol)
}

protocol LaunchesViewInputAndOutputProtocol {
    // MARK: - Input
    
    // MARK: - Output
    func viewDidLoad()
}
