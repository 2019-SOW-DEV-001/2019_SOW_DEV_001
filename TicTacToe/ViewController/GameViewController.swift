import UIKit

class GameViewController: UIViewController {
    private var gamePresenter : GamePresenter!
    @IBOutlet private weak var statusIndicator: UILabel!
    private var tappedButton : UIButton!
    private var buttonCollection : [UIButton] = []
    
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
        buttonCollection.append(tappedButton)
        gamePresenter.move(atPosition: BoardPosition(rawValue: sender.tag)!)
    }
    
    private func showStatus(){
        self.statusIndicator.text = "Player " + gamePresenter.getCurrentPlayer().rawValue + " turn"
    }
    
    private func show(_ message:String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.reset()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func reset() {
      resetPositions()
      gamePresenter.resetGame()
    }
    
    private func resetPositions() {
        buttonCollection.forEach({ (button) in
            button.setTitle("-", for: .normal)
        })
    }
    
}

extension GameViewController : GameStatus {
    func postionSaved() {
        showStatus()
        tappedButton.setTitle(gamePresenter.getCurrentPlayer().rawValue, for: .normal)
    }
    
    func positionAlreadyOccupied() {
        return
    }
    
    func playerXWins() {
        self.show("Player X Wins the Game")
    }
    
    func playerOWins() {
        self.show("Player O Wins the Game")
    }
    
    func gameDraw() {
        self.show("Match Draw")
    }
    
    func indicateNextPlayer() {
        showStatus()
    }
    
}
