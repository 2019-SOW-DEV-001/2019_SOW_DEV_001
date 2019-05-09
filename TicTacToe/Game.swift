class Game {
    private var currentPlayer: Player = .X
    private unowned let gameStatus: GameStatus
    
    init(gameStatus: GameStatus) {
        self.gameStatus = gameStatus
    }
    
    func move(atPosition: BoardPosition) {
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
        self.gameStatus.postionSaved()
    }
    
}
