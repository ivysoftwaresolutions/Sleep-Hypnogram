import Foundation
import HealthKit

/// Factory class to generate mock data for testing and previews.
class MockDataFactory {
    // MARK: - Constants

    /// The time interval for one hour (in seconds).
    private static let oneHourInterval: TimeInterval = 3600.0
    /// The time interval for half an hour (in seconds).
    private static let halfHourInterval: TimeInterval = 1800.0
    /// The time interval for two hours (in seconds).
    private static let twoHourInterval: TimeInterval = 7200.0

    // MARK: - Mock Data Methods

    /// Generates mock `HKCategorySample` sleep data for testing.
    ///
    /// - Returns: An array of `HKCategorySample` simulating a full night of sleep with all phases.
    static func generateMockHealthKitSleepData() -> [HKCategorySample] {
        let now = Date()
        return [
            // Awake Phase
            HKCategorySample(
                type: HKCategoryType.categoryType(forIdentifier: .sleepAnalysis)!,
                value: HKCategoryValueSleepAnalysis.awake.rawValue,
                start: now.addingTimeInterval(-twoHourInterval),
                end: now.addingTimeInterval(-oneHourInterval)
            ),
            // REM Sleep
            HKCategorySample(
                type: HKCategoryType.categoryType(forIdentifier: .sleepAnalysis)!,
                value: HKCategoryValueSleepAnalysis.asleepREM.rawValue,
                start: now.addingTimeInterval(-oneHourInterval),
                end: now.addingTimeInterval(-halfHourInterval)
            ),
            // Core Sleep
            HKCategorySample(
                type: HKCategoryType.categoryType(forIdentifier: .sleepAnalysis)!,
                value: HKCategoryValueSleepAnalysis.asleepCore.rawValue,
                start: now.addingTimeInterval(-halfHourInterval),
                end: now
            ),
            // Deep Sleep
            HKCategorySample(
                type: HKCategoryType.categoryType(forIdentifier: .sleepAnalysis)!,
                value: HKCategoryValueSleepAnalysis.asleepDeep.rawValue,
                start: now,
                end: now.addingTimeInterval(oneHourInterval)
            )
        ]
    }

    /// Generates mock `SleepSegment` data for testing or previews.
    ///
    /// - Returns: An array of `SleepSegment` simulating a full night of sleep with all phases.
    static func generateMockSleepSegments() -> [SleepSegment] {
        let now = Date()
        return [
            SleepSegment(
                startDate: now.addingTimeInterval(-twoHourInterval),
                endDate: now.addingTimeInterval(-oneHourInterval),
                phase: .awake
            ),
            SleepSegment(
                startDate: now.addingTimeInterval(-oneHourInterval),
                endDate: now.addingTimeInterval(-halfHourInterval),
                phase: .rem
            ),
            SleepSegment(
                startDate: now.addingTimeInterval(-halfHourInterval),
                endDate: now,
                phase: .core
            ),
            SleepSegment(
                startDate: now,
                endDate: now.addingTimeInterval(oneHourInterval),
                phase: .deep
            )
        ]
    }

    /// Generates a mock `HypnogramData` object.
    ///
    /// - Returns: A `HypnogramData` instance containing mock sleep segments and time data.
    static func generateMockHypnogramData() -> HypnogramData {
        let now = Date()
        return HypnogramData(
            segments: generateMockSleepSegments(),
            startTime: now.addingTimeInterval(-twoHourInterval),
            endTime: now.addingTimeInterval(oneHourInterval)
        )
    }
}
