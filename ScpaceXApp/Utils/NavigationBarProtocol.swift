//
//  NavigationBarProtocol.swift
//  ScpaceXApp
//
//  Created by Carlos Daniel Hernandez on 24/08/21.
//

import UIKit

protocol NavigationBarProtocol {}

extension NavigationBarProtocol where Self: UIViewController {
    func setupNavigationBarUI() {
        self.navigationController?.navigationBar.tintColor = .white
    }
}

extension UIViewController: NavigationBarProtocol {}
