//
//  LaunchesPresenter.swift
//  ScpaceXApp
//
//  Created by Carlos Daniel Hernandez on 22/08/21.
//

import Foundation
import RxSwift

final class LaunchesPresenter: LaunchesPresenterProtocol {
    private let interactor: LaunchesInteractorProtocol
    private let router: LaunchesRouterProtocol
    private let disposeBag = DisposeBag()
    
    init(interactor: LaunchesInteractorProtocol,
         router: LaunchesRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    
    func showLaunchesModule() {
        router.showLaunchesModule(presenter: self)
    }
    
    //MARK: - View Inpout and Outoput
    
    func viewDidLoad() {
        interactor.getLaunchesData()
            .subscribe(onSuccess: { launches in
                Log.log(launches)
            }).disposed(by: disposeBag)
    }
}
