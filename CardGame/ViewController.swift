//
//  ViewController.swift
//  CardGame
//
//  Created by Parker Donat on 4/19/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playCardImageView: UIImageView!
    @IBOutlet weak var computerCardImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CardController.drawCard(5) { (card) in
            print(card)
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playGameButtonTapped(sender: AnyObject) {
        //GameController.playGame()
        
        GameController.playGame { (winner, playerCard, computerCard) in
            
            ImageController.imageForURL(playerCard.imageEndpoint, completion: { (image) in
                self.playCardImageView.image = image
            })
            ImageController.imageForURL(computerCard.imageEndpoint, completion: { (image) in
                self.computerCardImageView.image = image
            })
            var resultText = ""
            if winner == .Player {
                resultText = "YOU WIN!"
            } else if winner == .Tie {
                resultText = "It's a tie."
            } else {
                resultText = "Loser!"
            }
            
            let alert = UIAlertController(title: resultText, message: nil, preferredStyle: .Alert)
            let action = UIAlertAction(title: "Dismiss", style: .Cancel, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }

}

