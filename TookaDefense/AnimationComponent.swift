//
//  AnimationComponent.swift
//  TookaDefense
//
//  Created by Antoine Beneteau on 10/11/2015.
//  Copyright © 2015 Tastyapp. All rights reserved.
//

import SpriteKit
import GameplayKit

enum AnimationState: String {
	case Idle = "Idle"
	case Walk = "Walk"
	case Hit = "Hurt"
	case Dead = "Dead"
	case Attacking = "Attacking"
}

struct Animation {
	let animationState: AnimationState
	let textures: [SKTexture]
	let repeatTexturesForever: Bool
}

class AnimationComponent: GKComponent {
	
	let node: SKSpriteNode
	
	var animations: [AnimationState: Animation]
	
	fileprivate(set) var currentAnimation: Animation?
	
	var requestedAnimationState: AnimationState?
	
	init(node: SKSpriteNode, textureSize: CGSize,
		animations: [AnimationState: Animation]) {
			
			self.node = node
			self.animations = animations
			super.init()
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	override func update(deltaTime: TimeInterval) {
		super.update(deltaTime: deltaTime)
		
		if let animationState = requestedAnimationState {
			runAnimationForAnimationState(animationState)
			requestedAnimationState = nil
		}
	}
	
	class func animationFromAtlas(_ type: String, withImageIdentifier: String, forAnimationState animationState: AnimationState,
		repeatTexturesForever: Bool = true) -> Animation {
			let textureAtlas = SKTextureAtlas(named: "\(type)")
			var textures = [SKTexture]()
			let imagesNumber: Int
			
			switch withImageIdentifier {
			case "Walk":
				imagesNumber = 10
			case "Hurt":
				imagesNumber = 5
			case "Dead":
				imagesNumber = 5
			default:
				imagesNumber = textureAtlas.textureNames.count
				
			}
		
			for i in 1...imagesNumber {
				let textureName = "\(withImageIdentifier)\(i)"
				textures.append(textureAtlas.textureNamed(textureName))
			}
			
			return Animation(animationState: animationState, textures: textures, repeatTexturesForever: repeatTexturesForever)
	}
	
	fileprivate func runAnimationForAnimationState(_ animationState: AnimationState) {
		
		let actionKey = "Animation"
		let timePerFrame = 0.1
		
		if currentAnimation != nil &&
			currentAnimation!.animationState == animationState { return }
		
		guard let animation = animations[animationState] else {
			print("Unknown animation for state \(animationState.rawValue)")
			return
		}
		
		node.removeAction(forKey: actionKey)
		
		let texturesAction: SKAction
		if animation.repeatTexturesForever {
			texturesAction = SKAction.repeatForever(SKAction.animate(with: animation.textures, timePerFrame: timePerFrame))
		}
		else {
			texturesAction = SKAction.animate(
				with: animation.textures, timePerFrame: timePerFrame)
		}
		
		node.run(texturesAction, withKey: actionKey)
		
		currentAnimation = animation
	}
}


