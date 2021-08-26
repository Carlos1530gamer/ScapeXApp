//
//  LocalizedEnum.swift
//  ScpaceXApp
//
//  Created by Carlos Daniel Hernandez on 24/08/21.
//

import Foundation

protocol LocalizedEnum {
    var rawValue: String { get }
    static var fileName: String { get }
}

extension LocalizedEnum {
    
    func localized(comment: String = "") -> String {
        NSLocalizedString(rawValue,
                          tableName: Self.fileName,
                          bundle: .main,
                          comment: comment)
    }
}
