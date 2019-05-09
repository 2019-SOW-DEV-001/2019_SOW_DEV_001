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
}
