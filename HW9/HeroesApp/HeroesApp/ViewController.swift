//
//  ViewController.swift
//  HeroesApp
//
//  Created by Uldana Shyndali on 26.11.2025.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var durability: UILabel!
    @IBOutlet weak var power: UILabel!
    @IBOutlet weak var combat: UILabel!
    @IBOutlet weak var intelligence: UILabel!
    @IBOutlet weak var strength: UILabel!
    
    let service = HeroesService()

    override func viewDidLoad() {
        super.viewDidLoad()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [ UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.0, 0.75]
        self.view.layer.insertSublayer(gradientLayer, above: heroImage.layer)
    }
    
    func configureHero(hero : HeroModel){
        heroName.text = "\(hero.name) \(hero.appearance.gender=="Male" ?  "♂" : (hero.appearance.gender == "Female" ? "♀": "⚲" ))"
        weight.text = hero.appearance.weight[1]
        height.text = hero.appearance.height[1]
        speed.text = "\(hero.powerstats.speed)"
        durability.text = "\(hero.powerstats.durability)"
        power.text = "\(hero.powerstats.power)"
        combat.text = "\(hero.powerstats.combat)"
        intelligence.text = "\(hero.powerstats.intelligence)"
        strength.text = "\(hero.powerstats.strength)"
        heroImage.kf.setImage(with: URL(string: hero.images.lg))
        
    }

    @IBAction func didRoll(_ sender: Any){
        Task { @MainActor in
            var hero: HeroModel? = nil
            repeat {
                let randomId = Int.random(in: 1...731)
                do {
                    hero = try await service.fetchHero(id: randomId)
                } catch {
                    if let urlError = error as? URLError {
                        print("Error: \(urlError)")
                    }
                    continue
                }
                
            } while hero == nil
        
            configureHero(hero: hero!)
        }
    }
    
}

