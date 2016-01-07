//
//  Layers.swift
//  TookaDefense
//
//  Created by antoine beneteau on 10/12/2015.
//  Copyright © 2015 tastyapp. All rights reserved.
//

import Foundation
import SpriteKit

enum GameLayer: CGFloat {
	static let zDeltaForSprites: CGFloat = 10
	
	case Background = -100
	case Shadows = -50
	case Sprites = 0
	case Hud = 1000
	case Overlay = 1100
	
	var nodeName: String {
		switch self {
		case .Background: return "Background"
		case .Shadows: return "Shadows"
		case .Sprites: return "Sprites"
		case .Hud: return "Hud"
		case .Overlay: return "Overlay"
		}
	}
	
	static var allLayers = [Background, Shadows, Sprites, Hud, Overlay]
}

var gameLayerNodes = [GameLayer: SKNode]()

func addNode(node: SKNode, toGameLayer: GameLayer) {
	gameLayerNodes[toGameLayer]!.addChild(node)
}