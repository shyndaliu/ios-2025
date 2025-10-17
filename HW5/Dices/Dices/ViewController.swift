//
//  ViewController.swift
//  Dices
//
//  Created by Uldana Shyndali on 15.10.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var affirmation : UILabel!
    @IBOutlet weak var getAffirmationButton : UIButton!
    
    let affirmations : [String] = [
        "I am confident and capable.",
        "I attract positive energy.",
        "I am growing every day.",
        "I choose peace over worry.",
        "I am proud of who I am becoming.",
        "I have the power to create change.",
        "I am enough as I am.",
        "I radiate love and kindness.",
        "I am grateful for this moment.",
        "I believe in my dreams.",
        "I trust the process of life.",
        "I release what no longer serves me.",
        "I am strong, calm, and centered.",
        "I deserve happiness and success.",
        "I am open to new opportunities.",
        "I am surrounded by love and support.",
        "I learn from challenges and grow stronger.",
        "I am at peace with my past.",
        "I welcome abundance into my life.",
        "I am the author of my own story."
    ]
    
    let defaultLabel : String = "What awaits me today?"

    

    override func viewDidLoad() {
        super.viewDidLoad()
        getAffirmationButton.layer.cornerRadius = 24
        affirmation.text = defaultLabel
        affirmation.numberOfLines = 0
        affirmation.lineBreakMode = .byWordWrapping 
    }
    
    @IBAction func getAffirmationButtonIsTap(_ sender: UIButton) {
        let randomIndex = Int.random(in: 0..<affirmations.count)
        let newAffirmation = affirmations[randomIndex]
        affirmation.text = newAffirmation
    }


}

