//
//  GameState.swift
//  TookaDefense
//
//  Created by Antoine Beneteau on 10/11/2015.
//  Copyright © 2015 Tastyapp. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit

class GameSceneState: GKState {
	unowned let scene: GameScene
	init(scene: GameScene) {
		self.scene = scene
	}
}


