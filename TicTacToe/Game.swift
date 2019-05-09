class Game {
    private var currentPlayer: Player = .X
    private unowned let gameStatus: GameStatus
    private let board = Board()
    
    init(gameStatus: GameStatus) {
        self.gameStatus = gameStatus
    }
    
    func move(atPosition: BoardPosition) {
        if isOccupied(atPosition) {
            self.gameStatus.positionAlreadyOccupied()
            return
        }
        
        mark(atPosition)
        
        if isAWin() {
            declareWinner()
            return
        }
        
        if isADraw() {
            self.gameStatus.gameDraw()
            return
        }
        
        rotatePlayer()
    }
    
    func getCurrentPlayer() -> Player {
        return self.currentPlayer
    }
    
    private func rotatePlayer() {
        if self.currentPlayer == .X {
            self.currentPlayer = .O
            return
        }
        self.currentPlayer = .X
    }
    
    private func mark(_ position: BoardPosition) {
        board.occupyPosition(position: position, player: self.currentPlayer)
        self.gameStatus.postionSaved()
    }
    
    private func isOccupied(_ position: BoardPosition) -> Bool {
        return board.isPositionOccupied(position: position)
    }
    
    private func isADraw() -> Bool {
        return board.isComplete()
    }
    
    private func isAWin() -> Bool {
        let winningRule = WinningRule()
        return winningRule.doesSatisfy(occupiedPositions: extractPositionsOfCurrentPlayer())
    }
    
    private func extractPositionsOfCurrentPlayer() -> [BoardPosition] {
        let positionOccupiedByCurrentPlayer = board.getFilledPositions().filter { $0.value == self.currentPlayer}
        return Array(positionOccupiedByCurrentPlayer.keys)
    }
    
    private func declareWinner() {
        if self.currentPlayer == .X {
            self.gameStatus.playerXWins()
            return
        }
        self.gameStatus.playerOWins()
    }
}
