//
//  ReuseIdentifierProtocol.swift
//  ScpaceXApp
//
//  Created by Carlos Daniel Hernandez on 24/08/21.
//

import Foundation
import UIKit

protocol ReuseIdentifierProtocol {}
extension ReuseIdentifierProtocol {
    static var reuseIdentifier: String { String(describing: self) }
}

extension UITableViewCell: ReuseIdentifierProtocol {}
