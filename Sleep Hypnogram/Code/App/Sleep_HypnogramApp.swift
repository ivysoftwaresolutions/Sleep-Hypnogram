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
    /// A mock manager is used when running on a simulator because HealthKit
    /// is not supported in the simulator environment. This allows for easier
    /// debugging and testing without needing a physical device.
    #if targetEnvironment(simulator)
    private let healthKitManager = MockHealthKitManager()
    #else
    private let healthKitManager = HealthKitManager()
    #endif

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(HypnogramViewModel(healthKitManager: healthKitManager))
        }
    }
}


