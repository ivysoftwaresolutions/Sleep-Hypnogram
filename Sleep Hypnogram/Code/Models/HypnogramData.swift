//
//  HypnogramData.swift
//
//  This file defines the `HypnogramData` structure, representing the complete sleep hypnogram data.
//  It aggregates multiple sleep segments into a single session and provides utilities for accessing
//  formatted time strings.
//

import Foundation

/// A structure containing the complete hypnogram data for a sleep session.
struct HypnogramData {
    /// An array of sleep segments, each representing a phase and its duration.
    let segments: [SleepSegment]
    /// The start time of the entire sleep session.
    let startTime: Date
    /// The end time of the entire sleep session.
    let endTime: Date

    /// A formatted string representation of the `startTime`.
    var startTimeText: String {
        return HypnogramData.dateFormatter.string(from: startTime)
    }

    /// A formatted string representation of the `endTime`.
    var endTimeText: String {
        return HypnogramData.dateFormatter.string(from: endTime)
    }

    // MARK: - Private

    /// A shared date formatter for converting `Date` to a readable string.
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        return formatter
    }()
}
