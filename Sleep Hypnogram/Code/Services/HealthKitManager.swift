import HealthKit

/// A manager class to handle HealthKit operations.
///
/// Responsibilities:
/// - Request HealthKit authorization.
/// - Fetch sleep data from HealthKit.
class HealthKitManager {
    /// The shared instance of the HealthKit store.
    private let healthStore = HKHealthStore()

    /// Requests HealthKit authorization to access sleep data.
    ///
    /// - Parameter completion: A closure that indicates whether authorization was successful.
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        // Define the data types to read.
        guard let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) else {
            completion(false)
            return
        }

        let typesToRead: Set = [sleepType]

        // Request authorization.
        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { success, error in
            if let error = error {
                print("HealthKit authorization error: \(error.localizedDescription)")
            }
            completion(success)
        }
    }

    /// Fetches sleep data from HealthKit.
    ///
    /// - Parameter completion: A closure with the results of the query as an array of `HKCategorySample`.
    func fetchSleepData(completion: @escaping ([HKCategorySample]?) -> Void) {
        guard let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) else {
            completion(nil)
            return
        }

        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now.addingTimeInterval(-86400)) // Yesterday's data
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)

        let query = HKSampleQuery(sampleType: sleepType, predicate: predicate, limit: 0, sortDescriptors: nil) { _, results, error in
            if let error = error {
                print("Error fetching sleep data: \(error.localizedDescription)")
                completion(nil)
            } else {
                completion(results as? [HKCategorySample])
            }
        }

        healthStore.execute(query)
    }
}
