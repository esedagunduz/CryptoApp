//
//  HapticManager.swift
//  Crypto
//
//  Created by ebrar seda gündüz on 12.12.2025.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
}
