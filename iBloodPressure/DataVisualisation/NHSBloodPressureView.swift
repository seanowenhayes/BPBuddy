import SwiftUI

/// Displays a blood pressure record using a chart based on the current NHS (Health serice in the U.K.) app.
///
struct NHSBloodPressureView: View {
    private let systolicYMarkings = [70.0, 90.0, 120.0, 135.0, 170.0]
    let reading: Reading

    var body: some View {
        HStack {
            Text("Systolic")
                .frame(maxHeight: .infinity)
                .rotationEffect(.degrees(270))
                .foregroundColor(.secondary)
            ZStack(alignment: .bottomLeading) {
                BackgroundView()
                SystolicAxisView()
                ReadingIndicatorView(reading: reading)
            }
            .frame(width: 240, height: 200)
            .border(.black)
            .padding()
        }
    }
}

#Preview("Example reading") {
    ReadingIndicatorView(reading: Reading.example)
}

#Preview("Very low") {
    ReadingIndicatorView(
        reading: Reading(time: Date.now, systolic: 0, diastolic: 0, pulse: 0)
    )
}

#Preview("Very high") {
    ReadingIndicatorView(
        reading: Reading(
            time: Date.now, systolic: 9999, diastolic: 9999, pulse: 99999
        )
    )
}

#Preview("Min OK reading") {
    ReadingIndicatorView(
        reading: Reading(
            time: Date.now, systolic: 90, diastolic: 60, pulse: 99999
        )
    )
}

#Preview("Max OK reading") {
    ReadingIndicatorView(
        reading: Reading(
            time: Date.now, systolic: 120, diastolic: 80, pulse: 99999
        )
    )
}

#Preview("Max slightly raised reading") {
    ReadingIndicatorView(
        reading: Reading(
            time: Date.now, systolic: 135, diastolic: 85, pulse: 99999
        )
    )
}
