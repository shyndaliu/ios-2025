//
//  ViewController.swift
//  Spotifity
//
//  Created by Uldana Shyndali on 03.11.2025.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let rotationAnimationKey = "rotation"

    @IBOutlet weak var vinylView: UIView!
    @IBOutlet weak var albumCover: UIImageView!
    
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackName: UILabel!
    
    
    struct Track {
        let trackName : String
        let artistName : String
        let audioName : String
        let albumCover : UIImage
        
        init(_ trackName : String, _ artistName: String, _ audioName:String, _ albumCover: UIImage){
            self.trackName = trackName
            self.artistName = artistName
            self.audioName = audioName
            self.albumCover = albumCover
        }
    }
    
    let tracks : [Track] = [Track("SHOOT (Firecracker)", "CHAEYOUNG","track1", #imageLiteral(resourceName: "track1")), Track("Спрячем слезы от посторонних", "Valery Meladze","track2", #imageLiteral(resourceName: "track2")), Track("Get Lit (feat. Fat Tony)", "A$AP ROCKY","track3", #imageLiteral(resourceName: "track3")), Track("Сұранамын", "Қайрат Нұртас", "track4", #imageLiteral(resourceName: "track4")), Track("Rain", "SWV", "track5", #imageLiteral(resourceName: "track5")) ]
    
    var currentTrackID = 0
    var isPlaying = false
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTrack(currentTrackID: currentTrackID)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        albumCover.clipsToBounds = true
        albumCover.layer.cornerRadius = albumCover.layer.bounds.width / 2
  
    }

    @IBAction func tappedPrevButton(_ sender: UIButton) {
        currentTrackID = (currentTrackID+tracks.count-1)%tracks.count
        updateTrack(currentTrackID: currentTrackID)
    }
    
    @IBAction func tappedControlButton(_ sender: UIButton) {
        isPlaying = !isPlaying
        if(!isPlaying){
            sender.setTitle("▶️" , for : .normal)
            pause()
        }else{
            sender.setTitle("⏸️", for: .normal)
            play()
        }
    }
    
    @IBAction func tappedNextButton(_ sender: UIButton) {
        currentTrackID = (currentTrackID+tracks.count+1)%tracks.count
        updateTrack(currentTrackID: currentTrackID)
    }
    
    
    private func play() {
        rotate(view: vinylView)
        player?.play()
    }
    
    private func pause() {
        stopRotating(view: vinylView)
        player?.pause()
    }
    
    private func updateTrack(currentTrackID: Int){
        initAudioPlayer(currentTrackID: currentTrackID)
        updateCover(currentTrackID: currentTrackID)
        updateTitles(currentTrackID: currentTrackID)
        if(isPlaying){
            play()
        }else{
            pause()
        }
    }
    
    private func initAudioPlayer(currentTrackID : Int){
        guard let url = Bundle.main.url(forResource: tracks[currentTrackID].audioName, withExtension: "mp3") else {
                    return
        }
        player = try? AVAudioPlayer(contentsOf: url)
    }
    
    private func updateCover(currentTrackID : Int){
        albumCover.image = tracks[currentTrackID].albumCover
    }
    
    private func updateTitles(currentTrackID : Int){
        trackName.text = tracks[currentTrackID].trackName
        artistName.text = tracks[currentTrackID].artistName
    }
    
    func rotate(view: UIView, duration: Double = 5) {
        if view.layer.animation(forKey: rotationAnimationKey) == nil {
                let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")

                rotationAnimation.fromValue = 0.0
                rotationAnimation.toValue = Float.pi * 2.0
                rotationAnimation.duration = duration
                rotationAnimation.repeatCount = Float.infinity

                view.layer.add(rotationAnimation, forKey: rotationAnimationKey)
            }
        }

    func stopRotating(view: UIView) {
        if view.layer.animation(forKey: rotationAnimationKey) != nil {
            view.layer.removeAnimation(forKey: rotationAnimationKey)
            }
    }
    //honestly, i copied this animation thing from the internet
    
}

