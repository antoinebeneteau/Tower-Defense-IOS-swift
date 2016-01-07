//
//  LoseNode.swift
//  TookaDefense
//
//  Created by antoine beneteau on 01/12/2015.
//  Copyright © 2015 tastyapp. All rights reserved.
//

import Foundation
import SpriteKit

class LoseNode: SKNode {
	
	override init() {
		super.init()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	var homeButton: SKSpriteNode {
		return self.childNodeWithName("homeButton") as! SKSpriteNode
	}
	var replayButton: SKSpriteNode {
		return self.childNodeWithName("replayButton") as! SKSpriteNode
	}
	var smsButton: SKSpriteNode {
		return self.childNodeWithName("smsButton") as! SKSpriteNode
	}
	var twitterButton: SKSpriteNode {
		return self.childNodeWithName("twitterButton") as! SKSpriteNode
	}
	var facebookButton: SKSpriteNode {
		return self.childNodeWithName("facebookButton") as! SKSpriteNode
	}
	
	var levelResLabel: SKLabelNode {
		return self.childNodeWithName("levelResLabel") as! SKLabelNode
	}
	var enemyResLabel: SKLabelNode {
		return self.childNodeWithName("enemyResLabel") as! SKLabelNode
	}
	var moneyResLabel: SKLabelNode {
		return self.childNodeWithName("moneyResLabel") as! SKLabelNode
	}
	var timeResLabel: SKLabelNode {
		return self.childNodeWithName("timeResLabel") as! SKLabelNode
	}
	
	
	func show(level: Int, enemy: Int, money: Int) {
		levelResLabel.text = "\(level)"
		enemyResLabel.text = "\(enemy)"
		moneyResLabel.text = "\(money)"
	}
	func hide() {
		let actionFadeOut = SKAction.fadeAlphaTo(0.0, duration: 0.5)
		let actionPop = SKAction.runBlock { () -> Void in
			self.removeFromParent()
		}
		let action = SKAction.sequence([actionFadeOut, actionPop])
		self.runAction(action)
	}
	
}