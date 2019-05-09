class Game {
    private var currentPlayer : Player = .X
    
    func move() {
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
    
}
