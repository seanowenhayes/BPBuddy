//

import SwiftUI

struct ReadingListItemView: View {
    
    private let reading: Reading
    private let model: ViewModel
    
    var body: some View {
        HStack {
            Text(reading.timeFormatted)
                .frame(maxWidth: .infinity)
                .foregroundColor(.secondary)
            Text("\(reading.systolic)")
                .frame(maxWidth: .infinity)
                .foregroundColor(.secondary)
            Text("\(reading.diastolic)")
                .frame(maxWidth: .infinity)
                .foregroundColor(.secondary)
            Image(systemName: model.iconForReading())
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 22)
                .foregroundStyle(getRecordStyle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
