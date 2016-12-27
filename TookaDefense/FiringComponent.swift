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
	var timeTillNextShot: TimeInterval = 0
	
	
	init(towerType: TowerType, parentNode: SKNode) {
		self.towerType = towerType
		self.parentNode = parentNode
		
		super.init()
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	override func update(deltaTime seconds: TimeInterval) {
		super.update(deltaTime: seconds)
		
		guard let target = currentTarget else { return }
		
		
		timeTillNextShot -= seconds
		if timeTillNextShot > 0 { return }
		timeTillNextShot = towerType.fireRate
		
		let projectile = ProjectileEntity(towerType: towerType)
		let projectileNode = projectile.spriteComponent.node
		projectileNode.position = CGPoint(x: 0.0, y: 0.0)
		parentNode.addChild(projectileNode)
		
		let targetNode = target.spriteComponent.node
		projectileNode.rotateToFaceNode(targetNode, sourceNode: parentNode)
		
		let fireVector = CGVector(dx: targetNode.position.x - parentNode.position.x, dy: targetNode.position.y - parentNode.position.y)
		
		let soundAction = SKAction.playSoundFileNamed("\(towerType.rawValue)Fire.mp3", waitForCompletion: false)
		let fireAction = SKAction.move(by: fireVector, duration: 0.2)
		let damageAction = SKAction.run { () -> Void in
			target.healthComponent.takeDamage(self.towerType.damage)
		}
		let removeAction = SKAction.run { () -> Void in
			projectileNode.removeFromParent()
		}
		
		let action = SKAction.sequence([soundAction, fireAction, damageAction,removeAction])
		projectileNode.run(action)
	}
}


