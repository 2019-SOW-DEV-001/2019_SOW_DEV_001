import UIKit

class GameViewController: UIViewController {
    private var boardPresenter : GamePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boardPresenter = GamePresenter(gameStatus: self)
    }

    @IBAction func occupyPosition(_ sender: UIButton) {
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
