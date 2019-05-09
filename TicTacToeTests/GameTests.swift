import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    private var game : Game!
    private var gameStatus : SpyGameStatus!
    
    override func setUp() {
        gameStatus = SpyGameStatus()
        game = Game(gameStatus: gameStatus)
    }
    
    func test_ShouldReturnPlayerX_AsPlayerXAlwaysStartsTheGame() {
        XCTAssertEqual(game.getCurrentPlayer(), Player.X)
    }
    
    func test_ShouldReturnPlayerO_When_AfterPlayerXcompletesFirstMove() {
        game.move(atPosition: .bottomLeft)
        
        XCTAssertEqual(game.getCurrentPlayer(), Player.O)
    }
    
    func test_ShouldCallPositionOccupied_When_PlayerXAndPlayerOmakeTheirRespectiveMoves() {
        game.move(atPosition: .bottomLeft)
        game.move(atPosition: .bottomRight)
        
        XCTAssertTrue(gameStatus.isPositionOccpied())
    }
}

class SpyGameStatus : GameStatus {
    private var positionTaken = false
    
    func postionOccupied() {
        positionTaken = true
    }
    
    fileprivate func isPositionOccpied() -> Bool {
        return positionTaken
    }
    
    
}
