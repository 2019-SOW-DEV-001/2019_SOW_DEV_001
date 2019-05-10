import XCTest

class GameViewUITests: XCTestCase {

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
    
    func testShouldShowAlertWithTextPlayerXWinstheGameWhenSecondRowIsOccupiedByX() {
        
        let app = XCUIApplication()
        app.buttons["middleLeft"].tap()
        app.buttons["leftTop"].tap()
        app.buttons["middleMiddle"].tap()
        app.buttons["middleTop"].tap()
        app.buttons["middleRight"].tap()
        XCTAssertTrue(app.alerts.staticTexts["Player X Wins the Game"].exists)
    }
    
    func testShouldShowMatchDrawWhenAllPositionsAreOccupied() {
        let app = XCUIApplication()
        app.buttons["leftTop"].tap()
        app.buttons["middleLeft"].tap()
        app.buttons["middleTop"].tap()
        app.buttons["rightTop"].tap()
        app.buttons["middleMiddle"].tap()
        app.buttons["bottomMiddle"].tap()
        app.buttons["middleRight"].tap()
        app.buttons["bottomRight"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["bottomLeft"]/*[[".buttons[\"-\"]",".buttons[\"bottomLeft\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.alerts.staticTexts["Match Draw"].exists)
    }
    
    func testShouldShowAlertWithTextPlayerOWinstheGameWhenTopRowIsOccupiedByO() {
        let app = XCUIApplication()
        app.buttons["middleLeft"].tap()
        app.buttons["leftTop"].tap()
        app.buttons["middleMiddle"].tap()
        app.buttons["middleTop"].tap()
        app.buttons["bottomLeft"].tap()
        app.buttons["rightTop"].tap()
        XCTAssertTrue(app.alerts.staticTexts["Player O Wins the Game"].exists)
    }
}
