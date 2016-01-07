//
//  Screens.swift
//  TookaDefense
//
//  Created by antoine beneteau on 10/12/2015.
//  Copyright © 2015 tastyapp. All rights reserved.
//

import Foundation
import SpriteKit

var readyScreen: ReadyNode!
var levelSelectorScreen: LevelSelectorNode!
var winScreen: WinNode!
var loseScreen: LoseNode!

func loadStateScreens() {
	let readyScenePath: String = NSBundle.mainBundle().pathForResource("MenuScene", ofType: "sks")!
	let readyScene = NSKeyedUnarchiver.unarchiveObjectWithFile(readyScenePath) as! SKScene
	readyScreen = (readyScene.childNodeWithName("MainNode"))!.copy() as! ReadyNode
	
	let levelSelectorScenePath: String = NSBundle.mainBundle().pathForResource("LevelSelector", ofType: "sks")!
	let levelSelectorScene = NSKeyedUnarchiver.unarchiveObjectWithFile(levelSelectorScenePath) as! SKScene
	levelSelectorScreen = (levelSelectorScene.childNodeWithName("MainNode"))!.copy() as! LevelSelectorNode
	
	let winScenePath: String = NSBundle.mainBundle().pathForResource("WinScene", ofType: "sks")!
	let winScene = NSKeyedUnarchiver.unarchiveObjectWithFile(winScenePath) as! SKScene
	winScreen = (winScene.childNodeWithName("MainNode"))!.copy() as! WinNode
	
	let loseScenePath: String = NSBundle.mainBundle().pathForResource("LoseScene", ofType: "sks")!
	let loseScene = NSKeyedUnarchiver.unarchiveObjectWithFile(loseScenePath) as! SKScene
	loseScreen = (loseScene.childNodeWithName("MainNode"))!.copy() as! LoseNode
}

func showReady(show: Bool) {
	if show {
		updateHUD()
		addNode(readyScreen, toGameLayer: .Overlay)
		readyScreen.show()
	}
	else {
		readyScreen.hide()
	}
}

func showLevelSelector(show: Bool) {
	if show {
		levelSelectorScreen.alpha = 0.0
		addNode(levelSelectorScreen, toGameLayer: .Overlay)
		levelSelectorScreen.runAction(SKAction.fadeAlphaTo(1.0, duration: 1.0))
	} else {
		levelSelectorScreen.hide()
	}
}

func showWin() {
	winScreen.alpha = 0.0
	addNode(winScreen, toGameLayer: .Overlay)
	winScreen.runAction(SKAction.sequence([SKAction.fadeAlphaTo(1.0, duration: 1.0)]))
	winScreen.show(levelToLoad, enemy: enemyKilled, money: gold)
}
func showLose() {
	loseScreen.alpha = 0.0
	addNode(loseScreen, toGameLayer: .Overlay)
	loseScreen.runAction(SKAction.sequence([SKAction.fadeAlphaTo(1.0, duration: 1.0)]))
	loseScreen.show(levelToLoad, enemy: enemyKilled, money: gold)
}