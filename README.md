# Sleep Hypnogram

Sleep Hypnogram is an iOS app that visualizes the user's sleep data in the form of a hypnogram. It uses HealthKit to access sleep data from the user's Apple Watch or iPhone and Swift Charts to display this data in an intuitive and visually appealing way.

![Simulator Screenshot - iPhone 16 Pro - 2024-11-19 at 18 09 51](https://github.com/user-attachments/assets/20b58a2a-ec36-4327-b8c8-7c8868c87bfa)

---

## Requirements

- **Xcode 15** or later.
  - Download Xcode from the [Mac App Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12) or [Apple Developer Downloads](https://developer.apple.com/download/all/).
- **iOS 16** or later.
- A physical iOS device with HealthKit-enabled data (Apple Watch recommended for sleep tracking).
- An Apple Developer Account to run the app on a device.

---

## Features

- Displays a hypnogram chart of the user's sleep data.
- Visualizes phases of sleep: **Awake**, **REM**, **Core**, and **Deep**.
- Uses **SwiftUI** and **Swift Charts** for a modern UI and smooth data rendering.

---

## Installation

1. **Download Xcode**:
   - If you don’t already have Xcode installed, download it from the [Mac App Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12) or [Apple Developer Downloads](https://developer.apple.com/download/all/).

2. **Clone the repository**:
   - Open the terminal and run the following commands:
     ```bash
     git clone https://github.com/ivysoftwaresolutions/Sleep-Hypnogram
     cd sleep-hypnogram
     ```

3. **Open the Xcode project**:
   - In the terminal, run:
     ```bash
     open "Sleep Hypnogram.xcodeproj"
     ```

4. **Set up code signing**:
   - In Xcode, navigate to **Project Settings** > **Signing & Capabilities**.
   - Select your **Apple Developer Team** and ensure all signing errors are resolved.

---

## Running the App

1. **Select a Physical Device**:
   - Sleep data is stored in HealthKit, which cannot be accessed in the Simulator. You must use a physical iOS device to run the app and access HealthKit data.

2. **Build and Run**:
   - In Xcode, select your device in the **target dropdown**.
   - Click **Run** (⌘R) to install the app on your device.

3. **Grant HealthKit Permissions**:
   - When prompted, allow the app to access your HealthKit data. Specifically, it needs permission to read **Sleep Analysis** data.

4. **Check for Sleep Data**:
   - Ensure that your device has valid sleep data:
     - Use an Apple Watch or another sleep tracking app that syncs sleep data with HealthKit.
     - Open the Health app on your iPhone to verify that sleep data is available.

---

## Testing Notes

- **Device Required**:
   - HealthKit cannot provide live data in the Simulator, so HealthKit data must be tested on a physical device with valid HealthKit data.
   - For SwiftUI Previews, mock data is provided to test the UI without requiring HealthKit access.
- **Simulator Ability**:
  - Views can be debugged with mock health data using the Simulator. This code is already integrated.
- **Mock Data for Previews**:
   - The app includes mock HealthKit data for SwiftUI previews, allowing you to test the UI layout and design in Xcode without requiring live data.

---

## Known Issues

- The app relies on accurate and complete HealthKit sleep data. If no data is available in HealthKit, the app will show a "No sleep data available" message.
- Unit testing has not been added.

---

## Deployment Target

- **Minimum iOS Version**: iOS 16
- **Supported Devices**: iPhones with HealthKit-enabled features (Apple Watch integration recommended).

---
