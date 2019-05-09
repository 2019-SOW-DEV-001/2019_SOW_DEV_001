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
        createMoves(positions: [.topLeft])
        
        XCTAssertEqual(game.getCurrentPlayer(), Player.O)
    }
    
    func test_ShouldCallPositionSaved_When_PlayerXAndPlayerOmakeTheirRespectiveMoves() {
        createMoves(positions: [.topLeft, .topRight])
        
        XCTAssertTrue(gameStatus.isPositionSaved())
    }
 
    func test_ShouldCallPositionAlreadyOccupied_When_PlayerXmakesAMoveAndPlayerOTriesToOccupySamePosition() {
        createMoves(positions: [.topLeft, .topLeft])
        
        XCTAssertTrue(gameStatus.isPositionAlreadyOccupiedCalled())
    }
    
    private func createMoves(positions: [BoardPosition]) {
        for position in positions {
            game.move(atPosition: position)
        }
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
