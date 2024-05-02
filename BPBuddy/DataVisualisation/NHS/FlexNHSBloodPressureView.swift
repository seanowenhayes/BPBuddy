//

import SwiftUI

struct FlexNHSBloodPressureView: View {
    @State private var graphWidth: Double = 0
    @State private var graphHeight: Double = 0
    
    var body: some View {
        
        
        

        Grid {
            GridRow {
                VStack {
                    /// YAxis systolic
                    Text("170")
                    Text("135")
                    Spacer()
                    Text("120")
                    Spacer()
                    Text("90")
                    Spacer()
                    Text("70")

                }.frame(maxHeight: .infinity)
                    .background(.orange)
                GeometryReader { geometryProxy in
                    ZStack {
                        /// Main graph display area
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.blue)
                }
                
            }
            GridRow {
                Spacer()
                HStack { /// X-Axis diastolic
                    Text("40")
                    Text("60")
                    Text("80")
                    Text("85")
                    Text("100")
                }
                .frame(maxWidth: .infinity)
                .background(.red)
            }

        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.green)
    }
}

#Preview {
    FlexNHSBloodPressureView()
}
