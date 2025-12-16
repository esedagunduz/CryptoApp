//
//  String.swift
//  Crypto
//
//  Created by ebrar seda gündüz on 17.12.2025.
//

import Foundation
extension String {
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
