protocol GameStatus : AnyObject {
    func postionSaved()
    func positionAlreadyOccupied()
    func playerXWins()
    func playerOWins()
    func gameDraw()
}
