//
//  GameController.swift
//  CardGame
//
//  Created by Parker Donat on 4/19/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation

class GameController {
    
    enum Winner {
        case Player
        case Computer
        case Tie
    }
    
    static func playGame(completion: (winner: Winner, playerCard: Card, computerCard: Card) -> Void) {
        
        CardController.drawCard(2) { (card) in
            guard card.count == 2 else {print("PROBLEM"); return}
            let playerCard = card[0]
            let computedCard = card[1]
            if playerCard.intValue > computedCard.intValue {
                completion(winner: .Player, playerCard: playerCard, computerCard: computedCard)
            } else if playerCard.intValue == computedCard.intValue {
                completion(winner: .Tie, playerCard: playerCard, computerCard: computedCard)
            } else {
                completion(winner: .Computer, playerCard: playerCard, computerCard: computedCard)
            }
        }
    }
}