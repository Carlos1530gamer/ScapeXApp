//
//  LaunchesViewController.swift
//  ScpaceXApp
//
//  Created by Carlos Daniel Hernandez on 22/08/21.
//

import UIKit

class LaunchesViewController: UIViewController {
    
    private let inputAndOutput: LaunchesViewInputAndOutputProtocol
    
    init(presenter: LaunchesViewInputAndOutputProtocol) {
        self.inputAndOutput = presenter
        super.init(nibName: String(describing: LaunchesViewController.self),
                   bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }

}
