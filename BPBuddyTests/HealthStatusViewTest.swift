@testable import BPBuddy
import SwiftUI
import XCTest

final class HealthStatusViewTest: XCTestCase {
    func testHighStatusStyle() throws {
        let model = HealthStatusView.ViewModel(healthStatus: .high)
        let highStyle = model.getRecordStyle()
        
        XCTAssertEqual(highStyle, Color.highBloodPressure)
    }
    
    func testHighStatusIcon() throws {
        let model = HealthStatusView.ViewModel(healthStatus: .high)
        let highIcon = model.iconForReading()
        
        XCTAssertEqual(highIcon, "arrow.up.heart.fill")
    }
    

    func testRaisedStatusStyle() throws {
        let model = HealthStatusView.ViewModel(healthStatus: .raised)
        let raisedStyle = model.getRecordStyle()
        
        XCTAssertEqual(raisedStyle, Color.raisedBloodPressure)
    }
    func testRaisedStatusIcon() throws {
        let model = HealthStatusView.ViewModel(healthStatus: .raised)
        let raisedIcon = model.iconForReading()
        
        XCTAssertEqual(raisedIcon, "arrow.up.heart")
    }

    func testHealthyStatusStyle() throws {
        let model = HealthStatusView.ViewModel(healthStatus: .healthy)
        let healthyStyle = model.getRecordStyle()
        
        XCTAssertEqual(healthyStyle, Color.healthyBloodPressure)
    }
    
    func testHealthyStatusIcon() throws {
        let model = HealthStatusView.ViewModel(healthStatus: .healthy)
        let healthyIcon = model.iconForReading()
        
        XCTAssertEqual(healthyIcon, "heart.circle")
    }

    func testLowStatusStyle() throws {
        let model = HealthStatusView.ViewModel(healthStatus: .low)
        let lowStyle = model.getRecordStyle()
        
        XCTAssertEqual(lowStyle, Color.lowBloodPressure)
    }
    
    func testLowStatusIcon() throws {
        let model = HealthStatusView.ViewModel(healthStatus: .low)
        let lowIcon = model.iconForReading()
        
        XCTAssertEqual(lowIcon, "arrow.down.heart")
    }
}
