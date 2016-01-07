//
//  ActiveState.swift
//  TookaDefense
//
//  Created by antoine beneteau on 14/12/2015.
//  Copyright © 2015 tastyapp. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit

class GameSceneActiveState: GameSceneState {
	
	override func didEnterWithPreviousState(previousState: GKState?) {
		scene.paused = false
		scene.waveManager.currentWave = 0
		showLevelSelector(false)
		scene.createGrid()
		scene.createOptionGrid()
		scene.initializeGrid()
		scene.createHUDGrid()
		scene.addHudStuff()
		scene.loadLevelMap(levelToLoad)
		
		scene.loadTowerSelectorNodes()
		
		scene.startFirstWave()
	}
	
	override func isValidNextState(stateClass: AnyClass) -> Bool {
		return stateClass == GameSceneWinState.self || stateClass == GameSceneLoseState.self || stateClass == GameSceneLevelSelector.self
	}
}