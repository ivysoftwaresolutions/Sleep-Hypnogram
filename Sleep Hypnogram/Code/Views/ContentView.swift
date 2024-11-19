import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: HypnogramViewModel

    var body: some View {
        HypnogramView()
            .onAppear {
                viewModel.requestAuthorization()
            }
    }
}

// MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(HypnogramViewModel(healthKitManager: MockHealthKitManager()))
    }
}
