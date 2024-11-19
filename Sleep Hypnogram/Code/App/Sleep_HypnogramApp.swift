//
//  Sleep_HypnogramApp.swift
//  Sleep Hypnogram
//
//  Created by Conor Sweeney on 11/19/24.
//

import SwiftUI

@main
struct Sleep_HypnogramApp: App {
    /// The shared instance of `HealthKitManager` to be injected into views.
    private let healthKitManager = HealthKitManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(HypnogramViewModel(healthKitManager: healthKitManager))
        }
    }
}

