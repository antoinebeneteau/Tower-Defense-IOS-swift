//
//  MenuNode.swift
//  TookaDefense
//
//  Created by antoine beneteau on 01/12/2015.
//  Copyright © 2015 tastyapp. All rights reserved.
//

import Foundation
import SpriteKit

class ReadyNode: SKNode {
	
	override init() {
		super.init()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	var playButton: SKSpriteNode {
		return self.childNode(withName: "playButton") as! SKSpriteNode
	}
	
	func show() {
	}
	
	func hide() {
		let actionFadeOut = SKAction.fadeAlpha(to: 0.0, duration: 0.3)
		let actionPop = SKAction.run { () -> Void in
			self.removeFromParent()
		}
		let action = SKAction.sequence([actionFadeOut, actionPop])
		self.run(action)
	}
}
