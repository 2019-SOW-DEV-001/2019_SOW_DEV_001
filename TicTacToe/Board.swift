typealias positionsWithPlayer = Dictionary<BoardPosition, Player>

class Board {
    private var filledPositions : positionsWithPlayer = [:]
    
    func occupyPosition(position : BoardPosition , player : Player) {
        self.filledPositions[position] = player
    }
    
    func getFilledPositions() -> positionsWithPlayer {
        return self.filledPositions;
    }
    
    func isPositionOccupied(position: BoardPosition) -> Bool {
        return self.filledPositions.keys.contains(position)
    }

}
