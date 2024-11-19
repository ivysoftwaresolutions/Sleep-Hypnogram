//
//  HypnogramStrings.swift
//  Centralized static strings for the Sleep Hypnogram app.
//
//  This file contains all text content used in the app, making it easier
//  to manage and update strings in one place.
//

import Foundation

/// A struct that contains all static strings used in the Sleep Hypnogram app.
struct HypnogramStrings {
    // MARK: - General Strings
    /// Title of the Sleep Hypnogram chart screen.
    static let title = "Sleep Hypnogram"
    /// Message displayed when no sleep data is available.
    static let noDataAvailable = "No sleep data available"

    // MARK: - Axis Labels
    /// Label for the X-axis (time) in the chart.
    static let xAxisLabel = "Time"
    /// Label for the Y-axis (sleep phases) in the chart.
    static let yAxisLabel = "Sleep Phase"

    // MARK: - Sleep Phase Labels
    /// Label for the Awake sleep phase.
    static let awake = "Awake"
    /// Label for the REM sleep phase.
    static let rem = "REM"
    /// Label for the Core sleep phase.
    static let core = "Core"
    /// Label for the Deep sleep phase.
    static let deep = "Deep"

    // MARK: - Time Labels
    /// Prefix for the start time text.
    static let start = "Start"
    /// Prefix for the end time text.
    static let end = "End"
    /// Text displayed when a time value is unavailable.
    static let unavailable = "N/A"

    // MARK: - Miscellaneous
    /// Placeholder for future localization or additional strings.
    static let placeholder = "Placeholder"
}
