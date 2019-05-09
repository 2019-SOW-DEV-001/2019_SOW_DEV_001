import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func test_ShouldReturnPlayerX_AsPlayerXAlwaysStartsTheGame() {
        let game = Game()
        
        XCTAssertEqual(game.getCurrentPlayer(), Player.X)
    }
}
