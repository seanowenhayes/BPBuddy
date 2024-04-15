import SwiftUI

/// Displays a blood pressure record using a chart based on the current NHS (Health serice in the U.K.) app.
///
struct NHSBloodPressureView: View {
    private var viewModel: ViewModel

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(.red.gradient)
            Rectangle().fill(.yellow.gradient)
                .frame(width: 180, height: 130)
            Rectangle().fill(.green.gradient)
                .frame(width: 160, height: 100)
            Rectangle().fill(.blue.gradient)
                .frame(width: 80, height: 40)
            Circle()
                .frame(width: 10, height: 10)
                .position(viewModel.readingPosition())
        }
        .frame(width: 240, height: 200)
        .border(.black)
    }

    init(reading: Reading) {
        viewModel = ViewModel(reading: reading)
    }
}

#Preview("Example reading") {
    NHSBloodPressureView(reading: Reading.example)
}

#Preview("Very low") {
    NHSBloodPressureView(
        reading: Reading(time: Date.now, systolic: 0, diastolic: 0, pulse: 0)
    )
}

#Preview("Very high") {
    NHSBloodPressureView(
        reading: Reading(
            time: Date.now, systolic: 9999, diastolic: 9999, pulse: 99999
        )
    )
}

#Preview("Min OK reading") {
    NHSBloodPressureView(
        reading: Reading(
            time: Date.now, systolic: 90, diastolic: 60, pulse: 99999
        )
    )
}

#Preview("Max OK reading") {
    NHSBloodPressureView(
        reading: Reading(
            time: Date.now, systolic: 120, diastolic: 80, pulse: 99999
        )
    )
}

#Preview("Max slightly raised reading") {
    NHSBloodPressureView(
        reading: Reading(
            time: Date.now, systolic: 135, diastolic: 85, pulse: 99999
        )
    )
}
