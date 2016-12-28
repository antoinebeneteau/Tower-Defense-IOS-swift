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
	
	case background = -100
	case shadows = -50
	case sprites = 0
	case hud = 1000
	case overlay = 1100
	
	var nodeName: String {
		switch self {
		case .background: return "Background"
		case .shadows: return "Shadows"
		case .sprites: return "Sprites"
		case .hud: return "Hud"
		case .overlay: return "Overlay"
		}
	}
	
	static var allLayers = [background, shadows, sprites, hud, overlay]
}

var gameLayerNodes = [GameLayer: SKNode]()

func addNode(_ node: SKNode, toGameLayer: GameLayer) {
	gameLayerNodes[toGameLayer]!.addChild(node)
}
