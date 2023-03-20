//
//  MainButtonViewController.swift
//
//
//  Через кнопки как и просили
// Жму на кнопки разными голосами

import UIKit


class MainButtonViewController: UIViewController {

    lazy var game = Concentration(numberofPairsOfCards: cardButtons.count / 2)
   
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["😈","🤡","🤩","💀","🤩","🤡","😈","🎃", "💩","🎃","💩","💀"]
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel(cardIndex: cardNumber)
        }
    }
    @IBAction func playAgainButtonPushed(_ sender: Any) {
        game.playAgain()
        shuffle()
        for index in cardButtons.indices {
            cardButtons[index].setTitle("", for: .normal)
        }
        flipCount = 0
    }
    
    func updateViewFromModel(cardIndex: Int){
        flipCard(wittEmoji: emojiChoices[cardIndex], on: cardButtons[cardIndex])
    }
    func flipCard( wittEmoji emoji: String, on button: UIButton ){
        
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
        } else {
            button.setTitle(emoji, for: .normal)
        }
        
    }
         
    private func shuffle() {
           
           for i in 0...emojiChoices.count - 1 {
               let j = Int(arc4random_uniform(UInt32(emojiChoices.count -  i))) + i
               if i != j {
                   let ptr = emojiChoices[i]
                   emojiChoices[i] = emojiChoices[j]
                   emojiChoices[j] = ptr
               }
           }
           
       }
            
    override func viewDidLoad() {
        super.viewDidLoad()
       
        for i in 0...cardButtons.count - 1 {
            buttonCongigure(button: cardButtons[i])
        }
        playAgainButton.setTitle("Заново", for: .normal)
        playAgainButton.layer.cornerRadius = 10
        playAgainButton.tintColor = .white
        playAgainButton.titleLabel?.font = .systemFont(ofSize: 20)
        playAgainButton.backgroundColor = .brown
        
        navigationItem.title = "Игра"
    }
    
    private func buttonCongigure(button: UIButton) {
        button.setTitle(" ", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.tintColor = .black
        button.layer.cornerRadius = 10
        button.backgroundColor = .orange
    }

    

}
