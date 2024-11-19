import HealthKit

/// Factory class to convert HealthKit data into the app's data models.
class HypnogramDataFactory {
    /// Converts an array of `HKCategorySample` into `HypnogramData`.
    ///
    /// - Parameter samples: An array of `HKCategorySample` objects.
    /// - Returns: A `HypnogramData` object or `nil` if the input is empty.
    static func createHypnogramData(from samples: [HKCategorySample]) -> HypnogramData? {
        // Check if samples are empty
        guard !samples.isEmpty else { return nil }

        // Map `HKCategorySample` to `SleepSegment`
        let segments = samples.map { sample in
            SleepSegment(
                startDate: sample.startDate,
                endDate: sample.endDate,
                phase: mapSleepPhase(sample.value)
            )
        }

        // Determine the overall start and end times
        let startTime = segments.first?.startDate ?? Date()
        let endTime = segments.last?.endDate ?? Date()

        // Return `HypnogramData`
        return HypnogramData(segments: segments, startTime: startTime, endTime: endTime)
    }

    // MARK: - Private Helper Methods

    /// Maps the HealthKit sleep value to a `SleepPhase`.
    ///
    /// - Parameter value: The integer value from `HKCategorySample`.
    /// - Returns: A `SleepPhase` corresponding to the value.
    private static func mapSleepPhase(_ value: Int) -> SleepPhase {
        switch value {
        case HKCategoryValueSleepAnalysis.awake.rawValue:
            return .awake
        case HKCategoryValueSleepAnalysis.asleepREM.rawValue:
            return .rem
        case HKCategoryValueSleepAnalysis.asleepCore.rawValue:
            return .core
        case HKCategoryValueSleepAnalysis.asleepDeep.rawValue:
            return .deep
        default:
            return .awake // Default to awake if the value is unrecognized
        }
    }
}
