import SwiftUI
import Charts

/// Factory class to generate views or components based on the `SleepPhase`.
class SleepPhaseViewFactory {
    // MARK: - Constants

    /// Corner radius for chart rectangle marks.
    private static let rectangleCornerRadius: CGFloat = 4.0

    // MARK: - Public Methods

    /// Generates a color view for the given sleep phase.
    ///
    /// - Parameter phase: The sleep phase for which the view is generated.
    /// - Returns: A `Color` representing the visual style of the phase.
    static func color(for phase: SleepPhase) -> Color {
        return getColor(for: phase)
    }

    /// Generates a label for the given sleep phase.
    ///
    /// - Parameter phase: The sleep phase for which the label is generated.
    /// - Returns: A `Text` view representing the label of the phase.
    static func label(for phase: SleepPhase) -> Text {
        Text(phase.rawValue)
            .font(.subheadline)
            .foregroundColor(HypnogramColors.textPrimary)
    }

    /// Generates a chart rectangle mark for the given sleep segment.
    ///
    /// - Parameter segment: The sleep segment for which the rectangle mark is generated.
    /// - Returns: A `RectangleMark` view for the chart.
    static func rectangleMark(for segment: SleepSegment) -> some ChartContent {
        RectangleMark(
            xStart: .value(HypnogramStrings.start, segment.startDate),
            xEnd: .value(HypnogramStrings.end, segment.endDate),
            y: .value(HypnogramStrings.yAxisLabel, segment.phase.rawValue)
        )
        .foregroundStyle(getColor(for: segment.phase)) // Use private method
        .cornerRadius(rectangleCornerRadius) // Use constant
    }

    // MARK: - Private Methods

    /// Internal method to get a color for the given sleep phase.
    ///
    /// - Parameter phase: The sleep phase for which the color is generated.
    /// - Returns: A `Color` representing the phase.
    private static func getColor(for phase: SleepPhase) -> Color {
        switch phase {
        case .awake: return HypnogramColors.awake
        case .rem: return HypnogramColors.rem
        case .core: return HypnogramColors.core
        case .deep: return HypnogramColors.deep
        }
    }
}
