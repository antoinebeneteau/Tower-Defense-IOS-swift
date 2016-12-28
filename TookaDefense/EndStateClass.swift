//
//  EndStateClass.swift
//  TookaDefense
//
//  Created by antoine beneteau on 14/12/2015.
//  Copyright © 2015 tastyapp. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit

class GameSceneWinState: GameSceneState {
	override func didEnter(from previousState: GKState?) {
		showWin()
	}
	override func isValidNextState(_ stateClass: AnyClass) -> Bool {
		return stateClass == GameSceneReadyState.self
	}
}

class GameSceneLoseState: GameSceneState {
	override func didEnter(from previousState: GKState?) {
		showLose()
	}
	override func isValidNextState(_ stateClass: AnyClass) -> Bool {
		return stateClass == GameSceneReadyState.self
	}
}
