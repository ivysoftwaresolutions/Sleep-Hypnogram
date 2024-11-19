//
//  HypnogramColors.swift
//  Centralized static colors for the Sleep Hypnogram app.
//
//  This file contains all colors used in the app, ensuring consistency and
//  simplifying updates in one place.
//

import SwiftUI

struct HypnogramColors {
    // MARK: - Sleep Phase Colors
    static let awake = Color.red.opacity(0.7)
    static let rem = Color.blue.opacity(0.5)
    static let core = Color.cyan.opacity(0.7)
    static let deep = Color.purple.opacity(0.8)

    // MARK: - General Colors
    static let background = Color(UIColor.systemBackground)
    static let textPrimary = Color.primary
    static let textSecondary = Color.secondary
}
