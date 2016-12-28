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
		return self.childNode(withName: "CostLabel") as! SKLabelNode
	}
	
	var towerIcon: SKSpriteNode {
		return self.childNode(withName: "TowerIcon") as! SKSpriteNode
	}
	
	override init() {
		super.init()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	func setTower(_ towerType: TowerType, pointForSelection: CGPoint) {
		towerIcon.texture = SKTexture(imageNamed: towerType.rawValue)
		towerIcon.name = "Tower_Icon_\(towerType.rawValue)"
		costLabel.text = "\(towerType.cost)"
		
		let moveAction = SKAction.moveBy(x: pointForSelection.x, y: pointForSelection.y, duration: 0.2)
		
		showAction = SKAction.group([moveAction])
		hideAction = showAction.reversed()
	}
	
	func setTowerSell(_ towerTypeToSell: TowerType, towerType: TowerType, pointForSelection: CGPoint) {
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
		let moveAction = SKAction.moveBy(x: pointForSelection.x, y: pointForSelection.y, duration: 0.2)
		
		showAction = SKAction.group([moveAction])
		hideAction = showAction.reversed()
	}
	
	func show() {
		self.run(showAction)
	}
	
	func hide(_ completion: @escaping () -> ()) {
		self.run(SKAction.sequence([
			hideAction, SKAction.run(completion)]))
	}
	
}

