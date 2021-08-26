//
//  LaunchesRouter.swift
//  ScpaceXApp
//
//  Created by Carlos Daniel Hernandez on 22/08/21.
//

import Foundation
import UIKit.UIViewController
import UIKit.UINavigationController

final class LaunchesRouter: LaunchesRouterProtocol {
    private var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func showLaunchesModule(presenter: LaunchesPresenterProtocol) {
        let view = LaunchesViewController(presenter: presenter)
        let navigation = UINavigationController(rootViewController: view)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}
