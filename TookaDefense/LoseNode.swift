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
		return self.childNode(withName: "homeButton") as! SKSpriteNode
	}
	var replayButton: SKSpriteNode {
		return self.childNode(withName: "replayButton") as! SKSpriteNode
	}
	var smsButton: SKSpriteNode {
		return self.childNode(withName: "smsButton") as! SKSpriteNode
	}
	var twitterButton: SKSpriteNode {
		return self.childNode(withName: "twitterButton") as! SKSpriteNode
	}
	var facebookButton: SKSpriteNode {
		return self.childNode(withName: "facebookButton") as! SKSpriteNode
	}
	
	var levelResLabel: SKLabelNode {
		return self.childNode(withName: "levelResLabel") as! SKLabelNode
	}
	var enemyResLabel: SKLabelNode {
		return self.childNode(withName: "enemyResLabel") as! SKLabelNode
	}
	var moneyResLabel: SKLabelNode {
		return self.childNode(withName: "moneyResLabel") as! SKLabelNode
	}
	var timeResLabel: SKLabelNode {
		return self.childNode(withName: "timeResLabel") as! SKLabelNode
	}
	
	
	func show(_ level: Int, enemy: Int, money: Int) {
		levelResLabel.text = "\(level)"
		enemyResLabel.text = "\(enemy)"
		moneyResLabel.text = "\(money)"
	}
	func hide() {
		let actionFadeOut = SKAction.fadeAlpha(to: 0.0, duration: 0.5)
		let actionPop = SKAction.run { () -> Void in
			self.removeFromParent()
		}
		let action = SKAction.sequence([actionFadeOut, actionPop])
		self.run(action)
	}
	
}
