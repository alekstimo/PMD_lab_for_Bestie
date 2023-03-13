//
//  MainButtonViewController.swift
//
//
//  Через кнопки как и просили
// Жму на кнопки разными голосами

import UIKit


class MainButtonViewController: UIViewController {

    
    var selectedCard = -1
    var model: Array<Card> = [Card(title: "😈",id: 0),Card(title: "🤡",id: 1),Card(title: "🤩",id: 2),Card(title: "💀",id: 3),Card(title: "🤩",id: 4),Card(title: "🤡",id: 5),Card(title: "😈",id: 6),Card(title: "🎃",id: 7),Card(title: "💩",id: 8),Card(title: "🎃",id: 9),Card(title: "💩",id: 10),Card(title: "💀",id: 11)]
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button7: UIButton!
  
    func switchButton( id: Int){
        switch id {
        case 0:
            if model[id].isSelected {
                button1.setTitle(model[id].title, for: .normal)
                button1.backgroundColor = .gray
            } else {
                button1.setTitle(" ", for: .normal)
                button1.backgroundColor = .orange
            }
            break
        case 1:
            if model[id].isSelected {
                button2.setTitle(model[id].title, for: .normal)
                button2.backgroundColor = .gray
            } else {
                button2.setTitle(" ", for: .normal)
                button2.backgroundColor = .orange
            }
            break
        case 2:
            if model[id].isSelected {
                button3.setTitle(model[id].title, for: .normal)
                button3.backgroundColor = .gray
            } else {
                button3.setTitle(" ", for: .normal)
                button3.backgroundColor = .orange
            }
            break
        case 3:
            if model[id].isSelected {
                button4.setTitle(model[id].title, for: .normal)
                button4.backgroundColor = .gray
            } else {
                button4.setTitle(" ", for: .normal)
                button4.backgroundColor = .orange
            }
            break
        case 4:
            if model[id].isSelected {
                button5.setTitle(model[id].title, for: .normal)
                button5.backgroundColor = .gray
            } else {
                button5.setTitle(" ", for: .normal)
                button5.backgroundColor = .orange
            }
            break
        case 5:
            if model[id].isSelected {
                button6.setTitle(model[id].title, for: .normal)
                button6.backgroundColor = .gray
            } else {
                button6.setTitle(" ", for: .normal)
                button6.backgroundColor = .orange
            }
            break
        case 6:
            if model[id].isSelected {
                button7.setTitle(model[id].title, for: .normal)
                button7.backgroundColor = .gray
            } else {
                button7.setTitle(" ", for: .normal)
                button7.backgroundColor = .orange
            }
            break
        case 7:
            if model[id].isSelected {
                button8.setTitle(model[id].title, for: .normal)
                button8.backgroundColor = .gray
            } else {
                button8.setTitle(" ", for: .normal)
                button8.backgroundColor = .orange
            }
            break
        case 8:
            if model[id].isSelected {
                button9.setTitle(model[id].title, for: .normal)
                button9.backgroundColor = .gray
            } else {
                button9.setTitle(" ", for: .normal)
                button9.backgroundColor = .orange
            }
            break
        case 9:
            if model[id].isSelected {
                button10.setTitle(model[id].title, for: .normal)
                button10.backgroundColor = .gray
            } else {
                button10.setTitle(" ", for: .normal)
                button10.backgroundColor = .orange
            }
            break
        case 10:
            if model[id].isSelected {
                button11.setTitle(model[id].title, for: .normal)
                button11.backgroundColor = .gray
            } else {
                button11.setTitle(" ", for: .normal)
                button11.backgroundColor = .orange
            }
            break
        case 11:
            if model[id].isSelected {
                button12.setTitle(model[id].title, for: .normal)
                button12.backgroundColor = .gray
            } else {
                button12.setTitle(" ", for: .normal)
                button12.backgroundColor = .orange
            }
            break
        default:
            break
        }
        
        
        
    }
    
    private func shuffle() {
        
        for i in 0...model.count - 1 {
            let j = Int(arc4random_uniform(UInt32(model.count -  i))) + i
            if i != j {
                let ptr = model[i].title
                model[i].title = model[j].title
                model[j].title = ptr
            }
        }
        
    }
    func compare(index1: Int, index2: Int ){
        if model[index1].title == model[index2].title {
            model[index1].isGuessed = true
            model[index2].isGuessed = true
        } else {
            model[index1].isSelected = false
            model[index2].isSelected = false
            switchButton(id: index1)
            switchButton(id: index2)
        }
        selectedCard = -1
    }
   
    
    
    @IBAction func playAgainButtonPushed(_ sender: Any) {
        for i in 0...model.count - 1 {
            model[i].isSelected = false
            model[i].isGuessed = false
            switchButton(id: i)
        }
        shuffle()
    }
    @IBAction func buttonPushed(_ sender: UIButton) {
        guard selectedCard >= 0 else {
            if model[sender.tag].isGuessed {
                return
            }
            model[sender.tag].isSelected = true
            selectedCard = sender.tag
            switchButton(id: sender.tag)
            return
        }
        model[sender.tag].isSelected = true
        switchButton(id: sender.tag)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){ [self] in
            compare(index1: sender.tag, index2: selectedCard)
           
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        buttonCongigure(button: button1)
        buttonCongigure(button: button2)
        buttonCongigure(button: button3)
        buttonCongigure(button: button4)
        buttonCongigure(button: button5)
        buttonCongigure(button: button6)
        buttonCongigure(button: button7)
        buttonCongigure(button: button8)
        buttonCongigure(button: button9)
        buttonCongigure(button: button10)
        buttonCongigure(button: button11)
        buttonCongigure(button: button12)
        
        
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
