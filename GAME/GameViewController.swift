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
    
    @IBOutlet weak var G: UIImageView!
    
    @IBOutlet weak var O: UIImageView!
    
    @IBOutlet weak var A: UIImageView!
    
    @IBOutlet weak var L: UIImageView!
    
    @IBOutlet weak var Z: UIImageView!
    
    @IBOutlet weak var Goal: UIImageView!
    
    @IBOutlet weak var Ball: UIImageView!
    
    @IBOutlet weak var Sound: UIButton!
    
    @IBOutlet weak var Mute: UIButton!
    

    
    @IBOutlet weak var pause: UIButton!
    

    @IBOutlet weak var Line: UIImageView!

    
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
        
        UIView.animate(withDuration: 1.7, animations: { self.Ball.frame = CGRect(x:133,y:275,width: 126, height: 44)}) {(finished)in
            self.Ball.isHidden = true
            //self.Goal.isHidden = true
        }
    
        
        player.play()
    }
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
    
    @IBAction func playPressed(_ sender: Any) {
        background.isHidden = true
        playButton.isHidden = true
        highScores.isHidden = true
        Mute.isHidden = true
        G.isHidden = true
        O.isHidden = true
        A.isHidden = true
        L.isHidden = true
        Z.isHidden = true

       
        
        // Goal.isHidden = true
       // Ball.isHidden = true

        Goal.isHidden = true
        Ball.isHidden = true
        Mute.isHidden = true
        Sound.isHidden = true
        
    
        UIView.animate(withDuration: 1.7, animations: { self.Ball.frame = CGRect(x:133,y:100,width: 126, height: 44)}) {(finished)in
            self.Ball.isHidden = true
        }
        
      
        UIView.animate(withDuration: 2.0, animations: { self.Line.frame = CGRect(x:200,y:311,width: 240, height: 128)}) {(finished)in
        }
        
        UIView.animate(withDuration: 2.0, animations: { self.Line.frame = CGRect(x:-51,y:311,width: 240, height: 128)}) {(finished)in
        }
        

        
        
    }
   

    @IBAction func highScoresPressed(_ sender: Any) {
        playButton.isHidden = true
        highScores.isHidden = true
        Sound.isHidden = true
    }
    

    @IBAction func Mute(_ sender: Any) {
    
    player.play()
            Mute.isHidden = true
            Sound.isHidden = false
    }
    
    @IBAction func Sound(_ sender: Any) {
    
            player.stop()
            Mute.isHidden = false
            Sound.isHidden = true
    
    }
    
    @IBAction func pausePressed(_ sender: Any) {
        
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
