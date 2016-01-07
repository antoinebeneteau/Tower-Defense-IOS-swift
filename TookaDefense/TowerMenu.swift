//
//  TowerMenu.swift
//  TookaDefense
//
//  Created by antoine beneteau on 26/11/2015.
//  Copyright © 2015 razeware. All rights reserved.
//

import SpriteKit

class TowerSelectorNode: SKNode {
	
	var showAction = SKAction()
	var hideAction = SKAction()
	
	var costLabel: SKLabelNode {
		return self.childNodeWithName("CostLabel") as! SKLabelNode
	}
	
	var towerIcon: SKSpriteNode {
		return self.childNodeWithName("TowerIcon") as! SKSpriteNode
	}
	
	override init() {
		super.init()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	func setTower(towerType: TowerType, pointForSelection: CGPoint) {
		towerIcon.texture = SKTexture(imageNamed: towerType.rawValue)
		towerIcon.name = "Tower_Icon_\(towerType.rawValue)"
		costLabel.text = "\(towerType.cost)"
		
		let moveAction = SKAction.moveByX(pointForSelection.x, y: pointForSelection.y, duration: 0.2)
		
		showAction = SKAction.group([moveAction])
		hideAction = showAction.reversedAction()
	}
	
	func setTowerSell(towerTypeToSell: TowerType, towerType: TowerType, pointForSelection: CGPoint) {
		towerIcon.texture = SKTexture(imageNamed: towerType.rawValue)
		towerIcon.name = "Tower_Icon_\(towerType.rawValue)"
		
		if towerTypeToSell == towerType {
			costLabel.text = "\(towerType.sellPrice)"
		} else {
			let costAfterSell = towerType.cost - towerTypeToSell.sellPrice
			if costAfterSell >= 0 {
				costLabel.text = "\(costAfterSell)"
			} else {
				costLabel.text = "+\(abs(costAfterSell))"
			}
		}
		let moveAction = SKAction.moveByX(pointForSelection.x, y: pointForSelection.y, duration: 0.2)
		
		showAction = SKAction.group([moveAction])
		hideAction = showAction.reversedAction()
	}
	
	func show() {
		self.runAction(showAction)
	}
	
	func hide(completion: () -> ()) {
		self.runAction(SKAction.sequence([
			hideAction, SKAction.runBlock(completion)]))
	}
	
}

