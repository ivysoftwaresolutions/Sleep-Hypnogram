import SwiftUI
import Charts

/// View for displaying the sleep hypnogram chart.
///
/// Responsibilities:
/// - Observes `HypnogramViewModel` to display hypnogram data.
/// - Shows a chart of sleep phases over time.
struct HypnogramView: View {
    /// ViewModel for managing the hypnogram data.
    @EnvironmentObject var viewModel: HypnogramViewModel

    /// Constant for the chart height.
    private let chartHeight: CGFloat = 300.0

    /// Constant for the X-axis stride count (time intervals in hours).
    private let strideCount: Int = 2

    /// Constant for segment width in the chart.
    private let segmentWidth: CGFloat = 50.0

    var body: some View {
        ScrollView(.horizontal) { // Horizontal scrolling enabled
            VStack {
                if let hypnogramData = viewModel.hypnogramData {
                    // Title
                    Text(HypnogramStrings.title)
                        .font(.title)
                        .padding()

                    // Chart
                    Chart {
                        ForEach(hypnogramData.segments, id: \.startDate) { segment in
                            SleepPhaseViewFactory.rectangleMark(for: segment) // Use View Factory here
                        }
                    }
                    .chartYAxis {
                        AxisMarks(values: [HypnogramStrings.awake, HypnogramStrings.rem, HypnogramStrings.core, HypnogramStrings.deep]) { value in
                            AxisValueLabel {
                                SleepPhaseViewFactory.label(for: SleepPhase(rawValue: value.as(String.self)!)!) // Use View Factory for labels
                            }
                        }
                    }
                    .chartXAxis {
                        AxisMarks(values: .stride(by: .hour, count: strideCount)) { // Use constant for stride count
                            AxisGridLine()
                            AxisTick()
                            AxisValueLabel(format: .dateTime.hour().minute())
                        }
                    }
                    .chartXAxisLabel(HypnogramStrings.xAxisLabel)
                    .chartYAxisLabel(HypnogramStrings.yAxisLabel)
                    .frame(width: CGFloat(hypnogramData.segments.count) * segmentWidth + segmentWidth, height: chartHeight) // Dynamic width with buffer
                    .padding()

                    // Start and End Times
                    Text("\(HypnogramStrings.start): \(hypnogramData.startTimeText)")
                    Text("\(HypnogramStrings.end): \(hypnogramData.endTimeText)")
                } else {
                    // No Data Available
                    Text(HypnogramStrings.noDataAvailable)
                }
            }
        }
    }
}

// MARK: - Preview

struct HypnogramView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HypnogramViewModel(healthKitManager: MockHealthKitManager())

        return HypnogramView()
            .environmentObject(viewModel)
    }
}
