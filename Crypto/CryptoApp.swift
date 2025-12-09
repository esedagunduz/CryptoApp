//
//  CryptoApp.swift
//  Crypto
//
//  Created by ebrar seda gündüz on 5.12.2025.
//

import SwiftUI

@main
struct CryptoApp: App {
    @StateObject private var  vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .environmentObject(vm)
    }
}
