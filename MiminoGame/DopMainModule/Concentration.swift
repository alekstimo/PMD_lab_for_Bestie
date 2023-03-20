//
//  Concentration.swift
//  MiminoGame
//
//  Created by Кирилл Зезюков on 20.03.2023.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    private var indexOfOneAdOnlyOneFAceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    }
                    else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set (newValue) {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAdOnlyOneFAceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAdOnlyOneFAceUpCard = index
            }
        }
    }
    
    func playAgain() {
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
    }
    
    init(numberofPairsOfCards: Int) {
        for _ in 1...numberofPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
    }
}
