//
//  LaunchesModule.swift
//  ScpaceXApp
//
//  Created by Carlos Daniel Hernandez on 22/08/21.
//

import UIKit

final class LaunchesModule {
    private let presenter: LaunchesPresenterProtocol
    
    init(baseViewController: UIViewController,
         presenter: LaunchesPresenterProtocol? = nil) {
        if let presenter = presenter {
            self.presenter = presenter
        } else {
            let router = LaunchesRouter(baseViewController: baseViewController)
            let interactor = LaunchesInteractor()
            let presenter = LaunchesPresenter(interactor: interactor,
                                              router: router)
            self.presenter = presenter
        }
    }
    
    func showLaunchesModule() {
        presenter.showLaunchesModule()
    }
}
