//
//  ProjectileEntity.swift
//  TookaDefense
//
//  Created by Antoine Beneteau on 10/11/2015.
//  Copyright © 2015 Tastyapp. All rights reserved.
//

import SpriteKit
import GameplayKit

class ProjectileEntity: GKEntity {
	
	var spriteComponent: SpriteComponent!
	
	init(towerType: TowerType) {
		super.init()
		
		let texture = SKTexture(imageNamed: "\(towerType.rawValue)Projectile")
		spriteComponent = SpriteComponent(entity: self, texture: texture, size: CGSize(width: texture.size().width / 2, height: texture.size().width / 2), name: "Projectile")
		addComponent(spriteComponent)
		
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}

