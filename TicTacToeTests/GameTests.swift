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
    
    func test_ShouldCallPlayerXWins_When_PlayerXfillsCompleteTopRow() {
        createMoves(positions: [.topLeft, .bottomLeft, .topMiddle, .bottomMiddle, .topRight])
        
        XCTAssertTrue(gameStatus.hasPlayerXWon())
    }
    
    func test_ShouldCallPlayerOWins_When_PlayerOfillsCompleteTopRow() {
        createMoves(positions: [.middleMiddle, .topLeft, .bottomLeft, .topMiddle, .bottomRight, .topRight])
        
        XCTAssertTrue(gameStatus.hasPlayerOWon())
    }
    
    func test_ShouldCallPlayerXWins_When_PlayerXfillsCompleteMiddleRow() {
        createMoves(positions: [.middleLeft, .topLeft, .middleMiddle, .bottomRight, .middleRight])
        
        XCTAssertTrue(gameStatus.hasPlayerXWon())
    }

    func test_ShouldCallPlayerOWins_When_PlayerOfillsCompleteMiddleRow() {
        createMoves(positions: [.topLeft, .middleLeft, .bottomRight, .middleMiddle, .topMiddle, .middleRight])
        
        XCTAssertTrue(gameStatus.hasPlayerOWon())
    }
    
    func test_ShouldCallPlayerXWins_When_PlayerXfillsCompleteBottomRow() {
        createMoves(positions: [.bottomLeft, .topLeft, .bottomMiddle, .middleLeft, .bottomRight])
        
        XCTAssertTrue(gameStatus.hasPlayerXWon())
    }
    
    func test_ShouldCallPlayerOWins_When_PlayerOfillsCompleteBottomRow() {
        createMoves(positions: [.middleLeft, .bottomLeft, .middleRight, .bottomMiddle, .topLeft, .bottomRight])
        
        XCTAssertTrue(gameStatus.hasPlayerOWon())
    }
    
    func test_ShouldCallPlayerXWins_When_PlayerXfillsCompleteFirstColumn() {
        createMoves(positions: [.topLeft, .topRight, .middleLeft, .middleRight, .bottomLeft])
        
        XCTAssertTrue(gameStatus.hasPlayerXWon())
    }
    
    func test_ShouldCallPlayerOWins_When_PlayerOfillsCompleteFirstColumn() {
        createMoves(positions: [.middleMiddle, .topLeft, .topMiddle, .middleLeft, .bottomRight, .bottomLeft])
        
        XCTAssertTrue(gameStatus.hasPlayerOWon())
    }
    
    func test_ShouldCallPlayerXWins_When_PlayerXfillsCompleteSecondColumn() {
        createMoves(positions: [.topMiddle, .topLeft, .middleMiddle, .topRight, .bottomMiddle])
        
        XCTAssertTrue(gameStatus.hasPlayerXWon())
    }
    
    func test_ShouldCallPlayerOWins_When_PlayerOfillsCompleteSecondColumn() {
        createMoves(positions: [.topLeft, .topMiddle,.topRight, .middleMiddle, .bottomRight, .bottomMiddle])
        
        XCTAssertTrue(gameStatus.hasPlayerOWon())
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
    private var playerXWinsCalled = false
    private var playerOWinsCalled = false
    
    func postionSaved() {
        positionSavedCalled = true
    }
    
    func positionAlreadyOccupied() {
        positionAlreadyOccupiedCalled = true
    }
    
    func playerXWins() {
        playerXWinsCalled = true
    }
    
    func playerOWins(){
        playerOWinsCalled = true
    }
    
    fileprivate func isPositionSaved() -> Bool {
        return positionSavedCalled
    }
    
    fileprivate func isPositionAlreadyOccupiedCalled() -> Bool {
        return positionAlreadyOccupiedCalled
    }
    
    fileprivate func hasPlayerXWon() -> Bool {
        return playerXWinsCalled
    }
    
    fileprivate func hasPlayerOWon() -> Bool {
        return playerOWinsCalled
    }
}
