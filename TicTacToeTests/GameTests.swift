import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func test_ShouldReturnPlayerX_AsPlayerXAlwaysStartsTheGame() {
        let game = Game()
        
        XCTAssertEqual(game.getCurrentPlayer(), Player.X)
    }
    
    func test_ShouldReturnPlayerO_When_AfterPlayerXcompletesFirstMove() {
        let game = Game()
        
        game.move()
        
        XCTAssertEqual(game.getCurrentPlayer(), Player.O)
    }
    
}
