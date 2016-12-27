//
//  DinosaurEntity.swift
//  TookaDefense
//
//  Created by Antoine Beneteau on 10/11/2015.
//  Copyright © 2015 Tastyapp. All rights reserved.
//

import Foundation
import UIKit
import GameplayKit
import SpriteKit

enum EnemyType: String {
	case Enemy1 = "Enemy1"
	case Enemy2 = "Enemy2"
	case Enemy3 = "Enemy3"
	case Enemy4 = "Enemy4"
	case Enemy5 = "Enemy5"
	case Boss1 = "Boss1"
	case Boss2 = "Boss2"
	
	var speed: Float {
		switch self {
		case .Enemy1: return 200
		case .Enemy2: return 150
		case .Enemy3: return 150
		case .Enemy4: return 150
		case .Enemy5: return 150
		case .Boss1: return 50
		case .Boss2: return 50
		}
	}
	
	var health: Int {
		switch self {
		case .Enemy1: return 200
		case .Enemy2: return 230
		case .Enemy3: return 230
		case .Enemy4: return 240
		case .Enemy5: return 250
		case .Boss1: return 2000
		case .Boss2: return 2000
		}
	}
	
	var goldReward: Int {
		switch self {
		case .Enemy1: return 30
		case .Enemy2: return 40
		case .Enemy3: return 50
		case .Enemy4: return 60
		case .Enemy5: return 70
		case .Boss1: return 100
		case .Boss2: return 100
		}
	}
	
	var baseDamage: Int {
		switch self {
		case .Enemy1: return 1
		case .Enemy2: return 1
		case .Enemy3: return 1
		case .Enemy4: return 1
		case .Enemy5: return 1
		case .Boss1: return 1
		case .Boss2: return 1
		}
	}
	
	var explosionParticule: String {
		switch self {
		case .Enemy1: return "Circle1"
		case .Enemy2: return "Circle2"
		case .Enemy3: return "Circle3"
		case .Enemy4: return "Circle4"
		case .Enemy5: return "Circle5"
		case .Boss1: return "Circle6"
		case .Boss2: return "Circle7"
		}
	}
	
	var size: Double {
		switch self {
		case .Enemy1: return 0.7
		case .Enemy2: return 0.7
		case .Enemy3: return 0.7
		case .Enemy4: return 0.7
		case .Enemy5: return 0.7
		case .Boss1: return 0.85
		case .Boss2: return 0.85
		}
	}
}

class EnemyEntity: GKEntity {
	
	let enemyType: EnemyType
	var spriteComponent: SpriteComponent!
	var animationComponent: AnimationComponent!
	var healthComponent: HealthComponent!
	var endPoint: CGPoint
	var slowed: Bool = false
	var boosted: Bool = false
	var teleported: Bool = false
	
	init(enemyType: EnemyType, size: CGSize, endPoint: CGPoint) {
		self.enemyType = enemyType
		self.endPoint = endPoint
		super.init()
		
		let textureAtlas = SKTextureAtlas(named: enemyType.rawValue)
		let defaultTexture = textureAtlas.textureNamed("Walk1")
		let sizeForEnemy = CGSize(width: size.width * CGFloat(enemyType.size), height: size.height * CGFloat(enemyType.size))
		
		spriteComponent = SpriteComponent(entity: self, texture: defaultTexture, size: sizeForEnemy, name: "Enemy")
		addComponent(spriteComponent)
		
		healthComponent = HealthComponent(parentNode: spriteComponent.node ,barWidth: 100, health: enemyType.health)
		addComponent(healthComponent)
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	func enemySlowed(_ slow: Float) {
		slowed = true
		spriteComponent.node.speed *= CGFloat(slow)
	}
	
	func enemyBoosted(_ boost: Float) {
		boosted = true
		spriteComponent.node.speed *= CGFloat(boost)
	}
	
	func enemyTeleported(_ toPoint: CGPoint) {
		teleported = true
		spriteComponent.node.position = toPoint
	}
}


