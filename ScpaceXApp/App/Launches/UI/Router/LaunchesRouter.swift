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
    private var baseViewController: UIViewController?
    private var navigation: UINavigationController? {
        baseViewController as? UINavigationController
    }
    
    init(baseViewController: UIViewController?) {
        self.baseViewController = baseViewController
    }
    
    func showLaunchesModule(presenter: LaunchesPresenterProtocol) {
        let view = LaunchesViewController(presenter: presenter)
        navigation?.pushViewController(view, animated: true)
    }
}
