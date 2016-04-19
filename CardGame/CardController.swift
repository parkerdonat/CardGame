//
//  CardController.swift
//  CardGame
//
//  Created by Parker Donat on 4/19/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation

class CardController {
    
    static let url = "http://deckofcardsapi.com/api/deck/new/draw/?count="
    
    static func drawCard(numberOfCards: Int, completion: (card: [Card]) -> Void) {
        let url = self.url + String(numberOfCards)
        
       NetworkController.dataAtURL(url) { (data) in
            guard let data = data,
                json = NetworkController.serializedDataAtJson(data),
                cardArray = json["cards"] as? [[String: AnyObject]] else { completion(card: []); return}
            
            let cards = cardArray.flatMap{Card(dictionary: $0)}
            completion(card: cards)
        }
    }
}
