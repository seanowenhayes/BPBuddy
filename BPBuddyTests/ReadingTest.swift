import XCTest
@testable import BPBuddy

final class ReadingTest: XCTestCase {
    
    /// LOW
    
    func testHealthStatusGivenAMidLowReading() throws {
        let reading = Reading(time: Date.now, systolic: 80, diastolic: 50)
        XCTAssertEqual(reading.healthStatus, .low)
    }
    
    func testHealthStatusGivenAMaxLowReading() throws {
        let reading = Reading(time: Date.now, systolic: 90, diastolic: 60)
        XCTAssertEqual(reading.healthStatus, .low)
    }
    
    func testHealthStatusGivenAMinLowReading() throws {
        let reading = Reading(time: Date.now, systolic: 90, diastolic: 60)
        XCTAssertEqual(reading.healthStatus, .low)
    }
    
    /// HEALTHY
    
    func testHealthStatusGivenAMinHealthyReading() throws {
        let reading = Reading(time: Date.now, systolic: 91, diastolic: 61)
        XCTAssertEqual(reading.healthStatus, .healthy)
    }
    
    func testHealthStatusGivenAMidHealthyReading() throws {
        let reading = Reading(time: Date.now, systolic: 100, diastolic: 60)
        XCTAssertEqual(reading.healthStatus, .healthy)
    }
    
    func testHealthStatusGivenAMaxHealthyReading() throws {
        let reading = Reading(time: Date.now, systolic: 120, diastolic: 80)
        XCTAssertEqual(reading.healthStatus, .healthy)
    }
    
    func testHealthStatusGivenLowSystolicHealthyDiastolic() throws {
        let reading = Reading(time: Date.now, systolic: 71, diastolic: 70)
        XCTAssertEqual(reading.healthStatus, .healthy)
    }
    
    func testHealthStatusGivenLowDiastolicHealthySystolic() throws {
        let reading = Reading(time: Date.now, systolic: 100, diastolic: 40)
        XCTAssertEqual(reading.healthStatus, .healthy)
    }
    
    /// RAISED
    func testHealthStatusGivenAMinRaisedReading() throws {
        let reading = Reading(time: Date.now, systolic: 121, diastolic: 81)
        XCTAssertEqual(reading.healthStatus, .raised)
    }
    
    func testHealthStatusGivenAMidRaisedReading() throws {
        let reading = Reading(time: Date.now, systolic: 130, diastolic: 82)
        XCTAssertEqual(reading.healthStatus, .raised)
    }
    
    func testHealthStatusGivenAMaxRaisedReading() throws {
        let reading = Reading(time: Date.now, systolic: 135, diastolic: 85)
        XCTAssertEqual(reading.healthStatus, .raised)
    }
    
    func testHealthStatusGivenAMinSystolicAndRaisedDiastolicReading() throws {
        let reading = Reading(time: Date.now, systolic: 83, diastolic: 82)
        XCTAssertEqual(reading.healthStatus, .raised)
    }
    
    func testHealthStatusGivenAMinDiastolicAndRaisedSyststolicReading() throws {
        let reading = Reading(time: Date.now, systolic: 130, diastolic: 40)
        XCTAssertEqual(reading.healthStatus, .raised)
    }
    
    /// HIGH
    
    func testHealthStatusGivenAMinHighReading() throws {
        let reading = Reading(time: Date.now, systolic: 136, diastolic: 86)
        XCTAssertEqual(reading.healthStatus, .high)
    }
    
    func testHealthStatusGivenAMidHighReading() throws {
        let reading = Reading(time: Date.now, systolic: 150, diastolic: 90)
        XCTAssertEqual(reading.healthStatus, .high)
    }
    
    func testHealthStatusGivenALowSystolicAndHighDiastolicReading() throws {
        let reading = Reading(time: Date.now, systolic: 88, diastolic: 87)
        XCTAssertEqual(reading.healthStatus, .high)
    }
    
    func testHealthStatusGivenAHighSystolicAndLowDiastolicReading() throws {
        let reading = Reading(time: Date.now, systolic: 150, diastolic: 40)
        XCTAssertEqual(reading.healthStatus, .high)
    }
}
