import Foundation

extension AddReadingView {
    @Observable
    class ViewModel {
        var  systolic: Int
        var diastolic: Int
        var pulse: Int
        
        init(systolic: Int, diastolic: Int, pulse: Int) {
            self.systolic = systolic
            self.diastolic = diastolic
            self.pulse = pulse
        }
    }
}
