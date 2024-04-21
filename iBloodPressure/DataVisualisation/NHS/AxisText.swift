import SwiftUI

struct AxisText: View {
    
    private let text: String
    
    var body: some View {
        Text(text)
            .font(.caption)
    }
    
    init(_ text: String) {
        self.text = text
    }
}

#Preview {
    AxisText("100")
}
