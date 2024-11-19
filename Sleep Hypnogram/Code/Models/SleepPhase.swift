//
//  SleepPhase.swift
//
//  This file defines the `SleepPhase` enumeration, representing the different phases of sleep.
//  Each case corresponds to a specific stage of sleep detected during sleep analysis.
//

import Foundation

/// Represents the different sleep phases detected during sleep analysis.
enum SleepPhase: String, CaseIterable {
    /// The user is awake.
    case awake = "Awake"
    /// Rapid Eye Movement (REM) sleep phase.
    case rem = "REM"
    /// Core sleep phase, typically light sleep.
    case core = "Core"
    /// Deep sleep phase, the most restorative sleep stage.
    case deep = "Deep"
}
