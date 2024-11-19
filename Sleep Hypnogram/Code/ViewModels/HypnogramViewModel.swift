import SwiftUI
import HealthKit

class HypnogramViewModel: ObservableObject {
    private let healthKitManager: HealthKitManager

    @Published var hypnogramData: HypnogramData?

    /// Initializes the view model with a specific `HealthKitManager` instance.
    ///
    /// - Parameter healthKitManager: An instance of `HealthKitManager`.
    init(healthKitManager: HealthKitManager = HealthKitManager()) {
        self.healthKitManager = healthKitManager
    }

    /// Requests authorization to access HealthKit data and fetches sleep data if granted.
    func requestAuthorization() {
        healthKitManager.requestAuthorization { [weak self] success in
            if success {
                self?.fetchSleepData()
            } else {
                print("HealthKit authorization denied.")
            }
        }
    }

    /// Fetches sleep data and processes it into `HypnogramData`.
    func fetchSleepData() {
        healthKitManager.fetchSleepData { [weak self] samples in
            let data = HypnogramDataFactory.createHypnogramData(from: samples ?? [])
            DispatchQueue.main.async {
                self?.hypnogramData = data
            }
        }
    }
}
