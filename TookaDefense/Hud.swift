//
//  HudClass.swift
//  TookaDefense
//
//  Created by antoine beneteau on 11/12/2015.
//  Copyright © 2015 tastyapp. All rights reserved.
//

import Foundation
import SpriteKit


var baseLabel: SKLabelNode!
var waveLabel: SKLabelNode!
var goldLabel: SKLabelNode!
var diamondLabel: SKLabelNode!

var levelToLoad: Int!
var baseLives = 5
var gold = 300
var moneySpent = 0
var diamond = 0
var enemyKilled = 0

var baseLabelImage = SKSpriteNode(imageNamed: "HeartImage")
var goldLabelImage = SKSpriteNode(imageNamed: "GoldImage")
var waveLabelImage = SKSpriteNode(imageNamed: "WaveImage")
var diamondLabelImage = SKSpriteNode(imageNamed: "Diamond")

var pauseButton = SKSpriteNode(imageNamed: "PauseButton")
var leaveButton = SKSpriteNode(imageNamed: "LeaveButton")
var buyButton = SKSpriteNode(imageNamed: "BuyButton")
var sellButton = SKSpriteNode(imageNamed: "SellButton")
var recordButton = SKSpriteNode(imageNamed: "RecordButton")

func layoutHUD() {
	let hudNode = gameLayerNodes[.hud]!
	
	baseLabel = hudNode.childNode(withName: "BaseLabel") as! SKLabelNode
	baseLabel.alpha = 0
	
	waveLabel = hudNode.childNode(withName: "WaveLabel") as! SKLabelNode
	waveLabel.alpha = 0
	
	goldLabel = hudNode.childNode(withName: "GoldLabel") as! SKLabelNode
	goldLabel.alpha = 0
	
	diamondLabel = hudNode.childNode(withName: "DiamondLabel") as! SKLabelNode
	diamondLabel.alpha = 0
}

func updateHUD() {
	baseLabel.text = "\(max(0, baseLives))"
	goldLabel.text = "\(gold)"
	diamondLabel.text = "\(diamond)"
}
