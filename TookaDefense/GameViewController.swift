//
//  GameViewController.swift
//  TookaDefense
//
//  Created by Antoine Beneteau on 10/11/2015.
//  Copyright © 2015 Tastyapp. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		resetGame()
	}
	
	func resetGame() {
		if let scene = GameScene(fileNamed:"GameScene") {
			// Configure the view.
			let skView = self.view as! SKView
			skView.showsFPS = true
			skView.showsNodeCount = true
			skView.showsPhysics = false
			
			/* Sprite Kit applies additional optimizations to improve rendering performance */
			skView.ignoresSiblingOrder = true
			/* Set the scale mode to scale to fit the window */
			scene.scaleMode = .aspectFill
			
			let reveal = SKTransition.doorsOpenHorizontal(withDuration: 0.5)
			skView.presentScene(scene, transition: reveal)
		}
	}
	
	override var shouldAutorotate : Bool {
		return true
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
	}
	
	override var prefersStatusBarHidden : Bool {
		return true
	}
}
