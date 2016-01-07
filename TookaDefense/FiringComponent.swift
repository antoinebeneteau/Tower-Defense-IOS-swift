//
//  FiringComponent.swift
//  TookaDefense
//
//  Created by Antoine Beneteau on 10/11/2015.
//  Copyright © 2015 Tastyapp. All rights reserved.
//

import SpriteKit
import GameplayKit

class FiringComponent: GKComponent {
	
	let towerType: TowerType
	let parentNode: SKNode
	var currentTarget: EnemyEntity?
	var timeTillNextShot: NSTimeInterval = 0
	
	
	init(towerType: TowerType, parentNode: SKNode) {
		self.towerType = towerType
		self.parentNode = parentNode
	}
	
	override func updateWithDeltaTime(seconds: NSTimeInterval) {
		super.updateWithDeltaTime(seconds)
		
		guard let target = currentTarget else { return }
		
		
		timeTillNextShot -= seconds
		if timeTillNextShot > 0 { return }
		timeTillNextShot = towerType.fireRate
		
		let projectile = ProjectileEntity(towerType: towerType)
		let projectileNode = projectile.spriteComponent.node
		projectileNode.position = CGPointMake(0.0, 0.0)
		parentNode.addChild(projectileNode)
		
		let targetNode = target.spriteComponent.node
		projectileNode.rotateToFaceNode(targetNode, sourceNode: parentNode)
		
		let fireVector = CGVectorMake(targetNode.position.x - parentNode.position.x, targetNode.position.y - parentNode.position.y)
		
		let soundAction = SKAction.playSoundFileNamed("\(towerType.rawValue)Fire.mp3", waitForCompletion: false)
		let fireAction = SKAction.moveBy(fireVector, duration: 0.2)
		let damageAction = SKAction.runBlock { () -> Void in
			target.healthComponent.takeDamage(self.towerType.damage)
		}
		let removeAction = SKAction.runBlock { () -> Void in
			projectileNode.removeFromParent()
		}
		
		let action = SKAction.sequence([soundAction, fireAction, damageAction,removeAction])
		projectileNode.runAction(action)
	}
}


