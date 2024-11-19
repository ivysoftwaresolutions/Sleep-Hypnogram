//
//  SleepSegment.swift
//
//  This file defines the `SleepSegment` structure, representing a segment of sleep within a specific
//  time range and phase. It encapsulates data about the duration and sleep phase for visualization
//  and analysis.
//

import Foundation

/// A structure representing a segment of sleep within a specific time range and phase.
struct SleepSegment {
    /// The start time of the sleep segment.
    let startDate: Date
    /// The end time of the sleep segment.
    let endDate: Date
    /// The phase of sleep during the segment.
    let phase: SleepPhase
}
