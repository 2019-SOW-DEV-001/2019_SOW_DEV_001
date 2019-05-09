typealias positionsWithPlayer = Dictionary<BoardPosition, Player>

class Board {
    private var filledPositions : positionsWithPlayer = [:]
    
    func occupyPosition(position : BoardPosition , player : Player) {
        self.filledPositions[position] = player
    }
    
    func getFilledPositions() -> positionsWithPlayer {
        return self.filledPositions;
    }

}
