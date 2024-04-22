//

import SwiftUI

struct ReadingListItemView: View {
    private let reading: Reading
    private let model: ViewModel

    var body: some View {
        GeometryReader { geometry in
            let aQuarterWidth = geometry.size.width / 4
            HStack {
                Text(reading.timeFormatted)
                    .frame(width: aQuarterWidth)
                Text("\(reading.systolic)")
                    .frame(width: aQuarterWidth)
                    .foregroundColor(.secondary)
                Text("\(reading.diastolic)")
                    .frame(width: aQuarterWidth)
                    .foregroundColor(.secondary)
                HStack {
                    Image(systemName: model.iconForReading())
                        .resizable()
                        .frame(width: 22, height: 22)
                        .foregroundStyle(getRecordStyle())
                }.frame(width: aQuarterWidth)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    init(reading: Reading) {
        self.reading = reading
        model = ViewModel(reading: reading)
    }

    func getRecordStyle() -> AnyGradient {
        switch reading.healthStatus {
        case .low:
            Color.lowBloodPressure
        case .healthy:
            Color.healthyBloodPressure
        case .raised:
            Color.raisedBloodPressure
        case .high:
            Color.highBloodPressure
        }
    }
}

#Preview {
    ReadingListItemView(reading: Reading.example)
}
