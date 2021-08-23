//
//  Logs.swift
//  ScpaceXApp
//
//  Created by Carlos Daniel Hernandez on 22/08/21.
//

import Foundation

enum Log {
    static func logParseError(_ items: Any...) {
        #if DEBUG
        debugPrint("❌ Parse Error ---- ", items, "------")
        #endif
    }
    
    static func log(_ items: Any...) {
        #if DEBUG
        debugPrint("✅", items, "\n")
        #endif
    }
}
