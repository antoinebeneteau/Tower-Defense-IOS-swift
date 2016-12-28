//
//  ObstaclesEntity.swift
//  TookaDefense
//
//  Created by antoine beneteau on 04/12/2015.
//  Copyright © 2015 Tastyapp. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

enum ObstacleType: String {
	case Wall = "Wall"
	case Slow = "Slow"
	case Boost = "Boost"
	case Repair = "Repair"
	case Diamond = "Diamond"
	case Teleport = "Teleport"
	
}

class ObstacleEntity: GKEntity {
	
	let obstacleType: ObstacleType
	var spriteComponent: SpriteComponent!
	
	init(obstacleType: ObstacleType, size: CGSize) {
		self.obstacleType = obstacleType
		
		super.init()
		
		let defaultTexture = SKTexture(imageNamed: "\(obstacleType.rawValue)")
		var textureSize = size
		
		if obstacleType == .Diamond {
			textureSize.height -= textureSize.height / 2.1
			textureSize.width -= textureSize.width / 2.1
		}
		
		spriteComponent = SpriteComponent(entity: self, texture: defaultTexture, size: textureSize, name: obstacleType.rawValue)
		addComponent(spriteComponent)
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}




