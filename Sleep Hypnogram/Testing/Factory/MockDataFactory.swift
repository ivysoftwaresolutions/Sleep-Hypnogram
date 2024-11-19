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
        generateMockSleepSegments().map { segment in
            HKCategorySample(
                type: HKCategoryType.categoryType(forIdentifier: .sleepAnalysis)!,
                value: sleepPhaseToHKValue(segment.phase),
                start: segment.startDate,
                end: segment.endDate
            )
        }
    }

    /// Generates mock `SleepSegment` data for testing or previews.
    ///
    /// - Returns: An array of `SleepSegment` simulating a full night of sleep with all phases.
    static func generateMockSleepSegments() -> [SleepSegment] {
        let now = Date()
        let eightHoursAgo = now.addingTimeInterval(-8 * oneHourInterval)

        return [
            // Awake Phase (short burst)
            SleepSegment(
                startDate: eightHoursAgo,
                endDate: eightHoursAgo.addingTimeInterval(10 * 60), // 10 minutes
                phase: .awake
            ),
            // Core Sleep
            SleepSegment(
                startDate: eightHoursAgo.addingTimeInterval(10 * 60),
                endDate: eightHoursAgo.addingTimeInterval(2 * oneHourInterval),
                phase: .core
            ),
            // REM Sleep
            SleepSegment(
                startDate: eightHoursAgo.addingTimeInterval(2 * oneHourInterval),
                endDate: eightHoursAgo.addingTimeInterval(2.5 * oneHourInterval), // 30 minutes
                phase: .rem
            ),
            // Deep Sleep
            SleepSegment(
                startDate: eightHoursAgo.addingTimeInterval(2.5 * oneHourInterval),
                endDate: eightHoursAgo.addingTimeInterval(4 * oneHourInterval), // 1.5 hours
                phase: .deep
            ),
            // Awake Phase (short burst)
            SleepSegment(
                startDate: eightHoursAgo.addingTimeInterval(4 * oneHourInterval),
                endDate: eightHoursAgo.addingTimeInterval(4 * oneHourInterval + 15 * 60), // 15 minutes
                phase: .awake
            ),
            // Core Sleep
            SleepSegment(
                startDate: eightHoursAgo.addingTimeInterval(4 * oneHourInterval + 15 * 60),
                endDate: eightHoursAgo.addingTimeInterval(6 * oneHourInterval), // 1.75 hours
                phase: .core
            ),
            // REM Sleep
            SleepSegment(
                startDate: eightHoursAgo.addingTimeInterval(6 * oneHourInterval),
                endDate: eightHoursAgo.addingTimeInterval(6.5 * oneHourInterval), // 30 minutes
                phase: .rem
            ),
            // Deep Sleep
            SleepSegment(
                startDate: eightHoursAgo.addingTimeInterval(6.5 * oneHourInterval),
                endDate: eightHoursAgo.addingTimeInterval(7.5 * oneHourInterval), // 1 hour
                phase: .deep
            ),
            // Awake Phase (short burst before waking)
            SleepSegment(
                startDate: eightHoursAgo.addingTimeInterval(7.5 * oneHourInterval),
                endDate: now, // End of 8-hour sleep cycle
                phase: .awake
            )
        ]
    }

    /// Generates a mock `HypnogramData` object.
    ///
    /// - Returns: A `HypnogramData` instance containing mock sleep segments and time data.
    static func generateMockHypnogramData() -> HypnogramData {
        let segments = generateMockSleepSegments()
        return HypnogramData(
            segments: segments,
            startTime: segments.first?.startDate ?? Date(),
            endTime: segments.last?.endDate ?? Date()
        )
    }

    // MARK: - Helpers

    /// Converts `SleepPhase` to `HKCategoryValueSleepAnalysis`.
    ///
    /// - Parameter phase: The sleep phase to convert.
    /// - Returns: The corresponding `HKCategoryValueSleepAnalysis`.
    private static func sleepPhaseToHKValue(_ phase: SleepPhase) -> Int {
        switch phase {
        case .awake: return HKCategoryValueSleepAnalysis.awake.rawValue
        case .rem: return HKCategoryValueSleepAnalysis.asleepREM.rawValue
        case .core: return HKCategoryValueSleepAnalysis.asleepCore.rawValue
        case .deep: return HKCategoryValueSleepAnalysis.asleepDeep.rawValue
        }
    }
}
