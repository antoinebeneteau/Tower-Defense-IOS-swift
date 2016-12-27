//
//  TowerEntity.swift
//  TookaDefense
//
//  Created by Antoine Beneteau on 10/11/2015.
//  Copyright © 2015 Tastyapp. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

enum TowerType: String {
	case Water = "WaterTower"
	case Plant = "PlantTower"
	case Ice = "IceTower"
	case Fire = "FireTower"
	
	static let allValues = [Water, Plant, Ice, Fire]
	
	var fireRate: Double {
		switch self {
		case .Water: return 1
		case .Plant: return 1
		case .Ice: return 0.7
		case .Fire: return 0.7
		}
	}
	
	var damage: Int {
		switch self {
		case .Water: return 35
		case .Plant: return 40
		case .Ice: return 55
		case .Fire: return 65
		}
	}
	
	var range: CGFloat {
		switch self {
		case .Water: return 100
		case .Plant: return 110
		case .Ice: return 125
		case .Fire: return 150
		}
	}
	
	var cost: Int {
		switch self {
		case .Water: return 50
		case .Plant: return 60
		case .Ice: return 100
		case .Fire: return 200
		}
	}
	
	var sellPrice: Int {
		switch self {
		case .Water: return 13
		case .Plant: return 22
		case .Ice: return   90
		case .Fire: return 200
		}
	}
	
	var upgradePrice: Int {
		switch self {
		case .Water: return 13
		case .Plant: return 22
		case .Ice: return   90
		case .Fire: return 200
		}
	}
	
	var color: UIColor {
		switch self {
		case .Water: return UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.0)
		case .Plant: return UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.0)
		case .Ice: return UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.0)
		case .Fire: return UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.0)
		}
	}
}

class TowerEntity: GKEntity {
	
	let towerType: TowerType
	var spriteComponent: SpriteComponent!
	var animationComponent: AnimationComponent!
	var firingComponent: FiringComponent!
	
	init(towerType: TowerType, size: CGSize) {
		self.towerType = towerType
		
		super.init()
		
		let defaultTexture = SKTexture(imageNamed: "\(towerType.rawValue)")
		let textureSize = size
		
		spriteComponent = SpriteComponent(entity: self, texture: defaultTexture, size: textureSize, name: "Tower")
		addComponent(spriteComponent)
		
		animationComponent = AnimationComponent(node: spriteComponent.node,
			textureSize: textureSize, animations: loadAnimations())
		addComponent(animationComponent)
		
		firingComponent = FiringComponent(towerType: towerType, parentNode: spriteComponent.node)
		addComponent(firingComponent)
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	func loadAnimations() -> [AnimationState: Animation] {
		var animations = [AnimationState: Animation]()
		
		animations[.Attacking] = AnimationComponent.animationFromAtlas(towerType.rawValue, withImageIdentifier: "Attacking",
			forAnimationState: .Attacking)
		
		return animations
	}
	
}



