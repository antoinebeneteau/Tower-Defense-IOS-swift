//
//  HealthComponent.swift
//  TookaDefense
//
//  Created by antoine beneteau on 05/12/2015.
//  Copyright © 2015 razeware. All rights reserved.
//

import SpriteKit
import GameplayKit

class HealthComponent: GKComponent {
	
	let fullHealth: Int
	var health: Int
	var healthBarFullWidth: CGFloat
	var healthBar: SKShapeNode
	
	let soundAction = SKAction.playSoundFileNamed("Hit.mp3", waitForCompletion: false)
	
	init(parentNode: SKNode, barWidth: CGFloat, health: Int) {
		
		self.fullHealth = health
		self.health = health
		
		healthBarFullWidth = barWidth / 2
		healthBar = SKShapeNode(path: UIBezierPath(rect: CGRect(x: parentNode.position.x - barWidth / 2, y: parentNode.position.x, width: barWidth / 2, height: 3)).cgPath, centered: true)
		
		healthBar.fillColor = UIColor.green
		healthBar.strokeColor = UIColor.green
		healthBar.position = CGPoint(x: parentNode.position.x, y: parentNode.position.y + 25)
		parentNode.addChild(healthBar)
		
		healthBar.isHidden = true
		
		super.init()
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	func takeDamage(_ damage: Int) -> Bool {
		health = max(health - damage, 0)
		
		healthBar.isHidden = false
		let healthScale = CGFloat(health)/CGFloat(fullHealth)
		let scaleAction = SKAction.scaleX(to: healthScale, duration: 0.5)
		healthBar.run(SKAction.group([soundAction, scaleAction]))
		return health == 0
	}
	
}



