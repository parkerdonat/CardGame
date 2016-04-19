//
//  Card.swift
//  CardGame
//
//  Created by Parker Donat on 4/19/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation

class Card {
    
    private let kImageKey = "image"
    private let kValueKey = "value"
    private let kSuitKey = "suit"
    
    let value: String
    let suit: String
    let imageEndpoint: String
    var intValue: Int {
        switch value {
            case "KING":
                return 13
            case "QUEEN":
                return 12
            case "JACK":
                return 11
            case "ACE":
                return 14
        default:
                return Int(value)!
        }
    }
    
    init(value: String, suit: String, imageEndpoint: String) {
        
        self.value = value
        self.suit = suit
        self.imageEndpoint = imageEndpoint
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let value = dictionary[kValueKey] as? String,
            let suit = dictionary[kSuitKey] as? String,
            let imageEndpoint = dictionary[kImageKey] as? String else { return  nil }
        
        self.value = value
        self.suit = suit
        self.imageEndpoint = imageEndpoint
    }
}
