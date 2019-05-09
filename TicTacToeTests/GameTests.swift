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
    
    func test_ShouldCallPositionSaved_When_PlayerXAndPlayerOmakeTheirRespectiveMoves() {
        game.move(atPosition: .bottomLeft)
        game.move(atPosition: .bottomRight)
        
        XCTAssertTrue(gameStatus.isPositionSaved())
    }
 
    func test_ShouldCallPositionAlreadyOccupied_When_PlayerXmakesAMoveAndPlayerOTriesToOccupySamePosition() {
        game.move(atPosition: .bottomLeft)
        game.move(atPosition: .bottomLeft)
        
        XCTAssertTrue(gameStatus.isPositionAlreadyOccupiedCalled())
    }
    
}

class SpyGameStatus : GameStatus {
    private var positionSavedCalled = false
    private var positionAlreadyOccupiedCalled = false
    
    func postionSaved() {
        positionSavedCalled = true
    }
    
    func positionAlreadyOccupied() {
        positionAlreadyOccupiedCalled = true
    }
    
    fileprivate func isPositionSaved() -> Bool {
        return positionSavedCalled
    }
    
    fileprivate func isPositionAlreadyOccupiedCalled() -> Bool {
        return positionAlreadyOccupiedCalled
    }
}
