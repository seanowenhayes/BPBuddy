import SwiftUI

struct ReadingListItemView: View {
    let reading: Reading

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            HStack {
                Text(reading.timeFormatted)
                    .frame(width: width * 0.24)
                Text("\(reading.systolic)")
                    .frame(width: width * 0.24)
                    .foregroundColor(.secondary)
                Text("\(reading.diastolic)")
                    .frame(width: width * 0.24)
                    .foregroundColor(.secondary)
                HStack {
                    HealthStatusView(healthStatus: reading.healthStatus)
                }.frame(width: width * 0.28)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

}

#Preview {
    ReadingListItemView(reading: Reading.example)
}
