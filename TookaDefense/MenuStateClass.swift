//
//  MenuStateClass.swift
//  TookaDefense
//
//  Created by antoine beneteau on 14/12/2015.
//  Copyright © 2015 tastyapp. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit

class GameSceneReadyState: GameSceneState {
	override func isValidNextState(_ stateClass: AnyClass) -> Bool {
		return stateClass == GameSceneLevelSelector.self || stateClass == GameSceneActiveState.self
	}
}
