//
//  ViewController.swift
//  Dices
//
//  Created by Uldana Shyndali on 17.10.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rollButton: UIButton!
    
    @IBOutlet weak var firstDice: UIImageView!
    
    @IBOutlet weak var thirdDice: UIImageView!
    @IBOutlet weak var secondDice: UIImageView!
    
    let diceImages: [UIImage] = [#imageLiteral(resourceName: "dice1"), #imageLiteral(resourceName: "dice2"), #imageLiteral(resourceName: "dice3"), #imageLiteral(resourceName: "dice4"), #imageLiteral(resourceName: "dice5"), #imageLiteral(resourceName: "dice6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func onRoll(_ sender: UIButton){
        firstDice.image = diceImages.randomElement()
        secondDice.image = diceImages.randomElement()
        thirdDice.image = diceImages.randomElement()
    }
    
}

