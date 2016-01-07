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
	let healthBarFullWidth: CGFloat
	let healthBar: SKShapeNode
	
	let soundAction = SKAction.playSoundFileNamed("Hit.mp3", waitForCompletion: false)
	
	init(parentNode: SKNode, barWidth: CGFloat, health: Int) {
		
		self.fullHealth = health
		self.health = health
		
		healthBarFullWidth = barWidth / 2
		healthBar = SKShapeNode(path: UIBezierPath(rect: CGRect(x: parentNode.position.x - barWidth / 2, y: parentNode.position.x, width: barWidth / 2, height: 3)).CGPath, centered: true)
		healthBar.fillColor = UIColor.greenColor()
		healthBar.strokeColor = UIColor.greenColor()
		healthBar.position = CGPointMake(parentNode.position.x, parentNode.position.y + 25)
		parentNode.addChild(healthBar)
		
		healthBar.hidden = true
	}
	
	func takeDamage(damage: Int) -> Bool {
		health = max(health - damage, 0)
		
		healthBar.hidden = false
		let healthScale = CGFloat(health)/CGFloat(fullHealth)
		let scaleAction = SKAction.scaleXTo(healthScale, duration: 0.5)
		healthBar.runAction(SKAction.group([soundAction, scaleAction]))
		return health == 0
	}
	
}



