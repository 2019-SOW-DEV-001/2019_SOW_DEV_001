import XCTest

class TicTacToeUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        XCUIApplication().launch()
    }
    
    func testShouldShowAlertWithTextPlayerXWinstheGameWhenTopRowIsOccupiedByX() {
        let app = XCUIApplication()
        app.buttons["leftTop"].tap()
        app.buttons["middleLeft"].tap()
        app.buttons["middleTop"].tap()
        app.buttons["middleMiddle"].tap()
        app.buttons["rightTop"].tap()
        XCTAssertTrue(app.alerts.staticTexts["Player X Wins the Game"].exists)
    }
    
    
}
