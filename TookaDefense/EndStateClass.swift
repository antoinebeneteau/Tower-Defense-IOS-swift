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
	override func didEnterWithPreviousState(previousState: GKState?) {
		showWin()
	}
	override func isValidNextState(stateClass: AnyClass) -> Bool {
		return stateClass == GameSceneReadyState.self
	}
}

class GameSceneLoseState: GameSceneState {
	override func didEnterWithPreviousState(previousState: GKState?) {
		showLose()
	}
	override func isValidNextState(stateClass: AnyClass) -> Bool {
		return stateClass == GameSceneReadyState.self
	}
}