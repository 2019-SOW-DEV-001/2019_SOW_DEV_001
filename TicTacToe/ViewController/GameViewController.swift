import UIKit

class GameViewController: UIViewController {
    private var gamePresenter : GamePresenter!
    @IBOutlet private weak var statusIndicator: UILabel!
    private var tappedButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTheGame()
    }

    
    private func startTheGame() {
        gamePresenter = GamePresenter(gameStatus: self)
        showStatus()
    }
    
    @IBAction func occupyPosition(_ sender: UIButton) {
        tappedButton = sender
        gamePresenter.move(atPosition: BoardPosition(rawValue: sender.tag)!)
    }
    
    private func showStatus(){
        self.statusIndicator.text = "Player " + gamePresenter.getCurrentPlayer().rawValue + " turn"
    }
    
}

extension GameViewController : GameStatus {
    func postionSaved() {
        showStatus()
        tappedButton.setTitle(gamePresenter.getCurrentPlayer().rawValue, for: .normal)
    }
    
    func positionAlreadyOccupied() {
    }
    
    func playerXWins() {
    }
    
    func playerOWins() {
    }
    
    func gameDraw() {
    }
    
    func indicateNextPlayer() {
        showStatus()
    }
    
}
