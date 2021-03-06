class WinningRule {
    private let winningPositions : [[BoardPosition]] = [[.topLeft,.topMiddle,.topRight], [.middleLeft,.middleMiddle,.middleRight],[.bottomLeft,.bottomMiddle,.bottomRight], [.topLeft,.middleLeft,.bottomLeft], [.topMiddle,.middleMiddle,.bottomMiddle],[.topRight,.middleRight,.bottomRight], [.topLeft, .middleMiddle, .bottomRight], [.topRight, .middleMiddle, .bottomLeft]]
    
    func doesSatisfy(occupiedPositions: [BoardPosition]) -> Bool {
        for singleWinPossibility in winningPositions {
            let singleWinPossibilitySet = Set(singleWinPossibility)
            let occupiedPositionsSet = Set(occupiedPositions)
            if singleWinPossibilitySet.isSubset(of: occupiedPositionsSet) {
                return true
            }
        }
        return false
    }
}
