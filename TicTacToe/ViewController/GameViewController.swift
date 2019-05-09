import UIKit

class GameViewController: UIViewController {
    private var gamePresenter : GamePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTheGame()
    }

    private func startTheGame() {
        gamePresenter = GamePresenter(gameStatus: self)
    }
    
    @IBAction func occupyPosition(_ sender: UIButton) {
        gamePresenter.move(atPosition: BoardPosition(rawValue: sender.tag)!)
    }
}

extension GameViewController : GameStatus {
    func postionSaved() {
    }
    
    func positionAlreadyOccupied() {
    }
    
    func playerXWins() {
    }
    
    func playerOWins() {
    }
    
    func gameDraw() {
    }
    
    
}
