//
//  GameSceneHelper.swift
//  TookaDefense
//
//  Created by Antoine Beneteau on 10/11/2015.
//  Copyright © 2015 Tastyapp. All rights reserved.
//

import SpriteKit
import GameKit
import AVFoundation


class GameSceneInit: SKScene {
	var graph: GKGridGraph<GKGridGraphNode>!
	var pathLine: SKNode!
	var path: [GKGridGraphNode]!
	
	var selectedBox: SKSpriteNode!
	var teleport = [ObstacleEntity]()
	var gamePaused: Bool = true
	var gameLoopPaused = true
	
	override func didMove(to view: SKView) {
		super.didMove(to: view)
		
		physicsWorld.gravity = CGVector.zero
		
		loadGameLayers()
		layoutHUD()
		loadStateScreens()
		
		showReady(true)
	}
	
	func loadGameLayers() {
		for gameLayer in GameLayer.allLayers {
			let foundNodes = self[gameLayer.nodeName]
			let layerNode = foundNodes.first!
			
			layerNode.zPosition = gameLayer.rawValue
			
			gameLayerNodes[gameLayer] = layerNode
		}
	}
}
