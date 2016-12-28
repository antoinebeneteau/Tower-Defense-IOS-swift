//
//  LevelSelectorNode.swift
//  TookaDefense
//
//  Created by antoine beneteau on 01/12/2015.
//  Copyright © 2015 tastyapp. All rights reserved.
//

import Foundation
import SpriteKit

class LevelSelectorNode: SKNode {
	override init() {
		super.init()
	}
	
	var worldNumberTitle: SKSpriteNode {
		return self.childNode(withName: "worldNumber") as! SKSpriteNode
	}
	var barTitle: SKSpriteNode {
		return self.childNode(withName: "barTitle") as! SKSpriteNode
	}
	
	func show() {
		worldNumberTitle.color = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
		barTitle.color = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
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
