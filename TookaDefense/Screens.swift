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
	let readyScenePath: String = Bundle.main.path(forResource: "MenuScene", ofType: "sks")!
	let readyScene = NSKeyedUnarchiver.unarchiveObject(withFile: readyScenePath) as! SKScene
	readyScreen = (readyScene.childNode(withName: "MainNode"))!.copy() as! ReadyNode
	
	let levelSelectorScenePath: String = Bundle.main.path(forResource: "LevelSelector", ofType: "sks")!
	let levelSelectorScene = NSKeyedUnarchiver.unarchiveObject(withFile: levelSelectorScenePath) as! SKScene
	levelSelectorScreen = (levelSelectorScene.childNode(withName: "MainNode"))!.copy() as! LevelSelectorNode
	
	let winScenePath: String = Bundle.main.path(forResource: "WinScene", ofType: "sks")!
	let winScene = NSKeyedUnarchiver.unarchiveObject(withFile: winScenePath) as! SKScene
	winScreen = (winScene.childNode(withName: "MainNode"))!.copy() as! WinNode
	
	let loseScenePath: String = Bundle.main.path(forResource: "LoseScene", ofType: "sks")!
	let loseScene = NSKeyedUnarchiver.unarchiveObject(withFile: loseScenePath) as! SKScene
	loseScreen = (loseScene.childNode(withName: "MainNode"))!.copy() as! LoseNode
}

func showReady(_ show: Bool) {
	if show {
		updateHUD()
		addNode(readyScreen, toGameLayer: .overlay)
		readyScreen.show()
	}
	else {
		readyScreen.hide()
	}
}

func showLevelSelector(_ show: Bool) {
	if show {
		levelSelectorScreen.alpha = 0.0
		addNode(levelSelectorScreen, toGameLayer: .overlay)
		levelSelectorScreen.run(SKAction.fadeAlpha(to: 1.0, duration: 1.0))
	} else {
		levelSelectorScreen.hide()
	}
}

func showWin() {
	winScreen.alpha = 0.0
	addNode(winScreen, toGameLayer: .overlay)
	winScreen.run(SKAction.sequence([SKAction.fadeAlpha(to: 1.0, duration: 1.0)]))
	winScreen.show(levelToLoad, enemy: enemyKilled, money: gold)
}
func showLose() {
	loseScreen.alpha = 0.0
	addNode(loseScreen, toGameLayer: .overlay)
	loseScreen.run(SKAction.sequence([SKAction.fadeAlpha(to: 1.0, duration: 1.0)]))
	loseScreen.show(levelToLoad, enemy: enemyKilled, money: gold)
}
