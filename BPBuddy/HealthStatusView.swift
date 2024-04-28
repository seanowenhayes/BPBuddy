import SwiftUI

struct HealthStatusView: View {
    private let model: ViewModel
    var body: some View {
        Image(systemName: model.iconForReading())
            .resizable()
            .frame(width: 22, height: 22)
            .foregroundStyle(model.getRecordStyle())
    }
    
    init(healthStatus: Reading.HealthStatus) {
        model = ViewModel(healthStatus: healthStatus)
    }
}

extension HealthStatusView {
    
    @Observable
    class ViewModel {
        private let healthStatus: Reading.HealthStatus
        
        init(healthStatus: Reading.HealthStatus) {
            self.healthStatus = healthStatus
        }
        
        func iconForReading() -> String {
            switch healthStatus {
                case .low:
                    "arrow.down.heart"
                case .healthy:
                    "heart.circle"
                case .raised:
                    "arrow.up.heart"
                case .high:
                    "arrow.up.heart.fill"
            }
        }
        
        func getRecordStyle() -> AnyGradient {
            switch healthStatus {
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
}

#Preview("Heallthy") {
    HealthStatusView(healthStatus: .healthy)
}

#Preview("High") {
    HealthStatusView(healthStatus: .high)
}

#Preview("Low") {
    HealthStatusView(healthStatus: .low)
}

#Preview("Raised") {
    HealthStatusView(healthStatus: .raised)
}
