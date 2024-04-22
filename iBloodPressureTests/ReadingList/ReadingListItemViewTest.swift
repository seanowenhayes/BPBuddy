@testable import iBloodPressure
import XCTest

final class ReadingListItemViewTest: XCTestCase {
    private func getReading(systolic: UInt, diastolic: UInt) -> Reading {
        Reading(time: Date.now, systolic: systolic, diastolic: diastolic)
    }
    
    private func lowReading() -> Reading {
        getReading(systolic: 80, diastolic: 40)
    }
    private func healthyReading() -> Reading {
        getReading(systolic: 100, diastolic: 70)
    }
    
    private func raisedReading() -> Reading {
        getReading(systolic: 125, diastolic: 82 )
    }
    
    private func highReading() -> Reading {
        getReading(systolic: 150, diastolic: 90)
    }

    func testGetLowIcon() throws {
        let model = ReadingListItemView.ViewModel(reading: lowReading())
        let icon = model.iconForReading()
        XCTAssertEqual(icon, "arrow.down.heart")
    }
    
    func testGetHealthyIcon() throws {
        let model = ReadingListItemView.ViewModel(reading: healthyReading())
        let icon = model.iconForReading()
        XCTAssertEqual(icon, "heart.circle")
    }
    
    func testGetRaisedIcon() throws {
        let model = ReadingListItemView.ViewModel(reading: raisedReading())
        let icon = model.iconForReading()
        XCTAssertEqual(icon, "arrow.up.heart")
    }
    
    func testHighIcon() throws {
        let model = ReadingListItemView.ViewModel(reading: highReading())
        let icon = model.iconForReading()
        XCTAssertEqual(icon, "arrow.up.heart.fill")
    }
    
}
