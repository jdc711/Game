//
//  GameViewController.swift
//  GAME
//
//  Created by Carter Stambaugh on 5/25/19.
//  Copyright © 2019 JCAPP. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation
class GameViewController: UIViewController {

   
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var highScores: UIButton!
    
    
    @IBOutlet weak var mute: UIButton!
    
    
    
    var player: AVAudioPlayer!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do{
            player = try AVAudioPlayer(contentsOf: url)
           player.numberOfLoops = -1
            player.prepareToPlay()
        }catch let error as NSError {
            print(error.description)
        }
    
        
        player.play();
        
        
        
        /*// Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        if let scene = GKScene(fileNamed: "GameScene") {
            
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! GameScene? {
                
                // Copy gameplay related content over to the scene
                sceneNode.entities = scene.entities
                sceneNode.graphs = scene.graphs
                
                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .aspectFill
                
                // Present the scene
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true
                }
            }
        }
    }
    
         */
        
    }
    @IBAction func playPressed(_ sender: Any) {
        background.isHidden = true
         playButton.isHidden = true
         highScores.isHidden = true
         mute.isHidden = true
        
    }
    

    @IBAction func highScoresPressed(_ sender: Any) {
        
        playButton.isHidden = true
        highScores.isHidden = true
        mute.isHidden = true
        
    }
    
    @IBAction func soundPressed(_ sender: Any) {
        if (player.isPlaying){
             player.stop()
        }
        else{
            player.play()
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
