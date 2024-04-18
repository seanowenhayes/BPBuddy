import XCTest
@testable import iBloodPressure

final class ReadingTest: XCTestCase {

    func testHealthStatusGivenAHealthyReading() throws {
        let reading = Reading(time: Date.now, systolic: 100, diastolic: 60, pulse: 70)
        XCTAssertEqual(reading.healthStatus, "healthy")
    }
    
    func testHealthStatusGivenALowReading() throws {
        let reading = Reading(time: Date.now, systolic: 80, diastolic: 50, pulse: 70)
        XCTAssertEqual(reading.healthStatus, "low")
    }

}
