import XCTest
@testable import iBloodPressure

final class ReadingIndicatorViewViewModelTest: XCTestCase {

    func testGetPointAsBottomLeftGivenSystolicAndDiastolicAreBelowMinimumOfChart() throws {
        let reading = Reading(time: Date.now, systolic: 0, diastolic: 0, pulse: 0)
        let model = ReadingIndicatorView.ViewModel(reading: reading)
        let point = model.readingPosition()
        XCTAssertEqual(point.x, 0.0)
        XCTAssertEqual(point.y, 200.0)
    }

    func testGetTopRightGivenSystolicAndDiastolicAboveChartMaximum() throws {
        let reading = Reading(time: Date.now, systolic: 99999, diastolic: 999999, pulse: 0)
        let model = ReadingIndicatorView.ViewModel(reading: reading)
        let point = model.readingPosition()
        XCTAssertEqual(point.x, 240.0)
        XCTAssertEqual(point.y, 0.0)
    }

}
