//
//  ViewController.swift
//  VS Model
//
//  Created by Uldana Shyndali on 17.10.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var model: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var clickMeButton: UIButton!


    let models : [String : UIImage] = [
        "Adriana Lima" : #imageLiteral(resourceName: "photo_2025-10-17_12-22-21"),
        "Gisele Bundchen" : #imageLiteral(resourceName: "photo_2025-10-17_12-22-23"),
        "Anok Yai" : #imageLiteral(resourceName: "photo_2025-10-17_12-22-25"),
        "Gigi Hadid" : #imageLiteral(resourceName: "photo_2025-10-17_12-22-27"),
        "Barbara Palvin" : #imageLiteral(resourceName: "photo_2025-10-17_12-22-24"),
        "Alex Consani" : #imageLiteral(resourceName: "photo_2025-10-17_12-22-25 (2)"),
        "Miranda Kerr" : #imageLiteral(resourceName: "photo_2025-10-17_12-22-22"),
        "Bella Hadid" : #imageLiteral(resourceName: "photo_2025-10-17_12-22-26")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onClickMeButton(_ sender: UIButton) {
        let (modelName, modelImage) = models.randomElement()!
        label.text = modelName
        model.image = modelImage
        model.contentMode = .scaleAspectFill
        model.clipsToBounds = true
        model.layer.contentsGravity = .resizeAspectFill
        model.layer.contentsRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        model.layer.contentsGravity = .resizeAspectFill
        model.layer.contentsCenter = CGRect(x: 0.5, y: 0, width: 0, height: 1)
    }
    
}

