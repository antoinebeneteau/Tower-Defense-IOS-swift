//
//  LevelStateClass.swift
//  TookaDefense
//
//  Created by antoine beneteau on 14/12/2015.
//  Copyright © 2015 tastyapp. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit

class GameSceneLevelSelector: GameSceneState {
	override func didEnterWithPreviousState(previousState: GKState?) {
		showReady(false)
		showLevelSelector(true)
	}
	override func isValidNextState(stateClass: AnyClass) -> Bool {
		return stateClass == GameSceneActiveState.self
	}
}