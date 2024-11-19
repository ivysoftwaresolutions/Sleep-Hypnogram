import HealthKit

/// A mock version of `HealthKitManager` for SwiftUI previews.
class MockHealthKitManager: HealthKitManager {

  override func requestAuthorization(completion: @escaping (Bool) -> Void) {
    // Simulate a successful authorization
    completion(true)
  }

  override func fetchSleepData(completion: @escaping ([HKCategorySample]?) -> Void) {
    completion(MockDataFactory.generateMockHealthKitSleepData())
  }
}
