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
	
	private(set) var currentAnimation: Animation?
	
	var requestedAnimationState: AnimationState?
	
	init(node: SKSpriteNode, textureSize: CGSize,
		animations: [AnimationState: Animation]) {
			
			self.node = node
			self.animations = animations
	}
	
	override func updateWithDeltaTime(deltaTime: NSTimeInterval) {
		super.updateWithDeltaTime(deltaTime)
		
		if let animationState = requestedAnimationState {
			runAnimationForAnimationState(animationState)
			requestedAnimationState = nil
		}
	}
	
	class func animationFromAtlas(type: String, withImageIdentifier: String, forAnimationState animationState: AnimationState,
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
			
			for var i = 1; i <= imagesNumber; i++ {
				let textureName = "\(withImageIdentifier)\(i)"
				textures.append(textureAtlas.textureNamed(textureName))
			}
			
			return Animation(animationState: animationState, textures: textures, repeatTexturesForever: repeatTexturesForever)
	}
	
	private func runAnimationForAnimationState(animationState: AnimationState) {
		
		let actionKey = "Animation"
		let timePerFrame = 0.1
		
		if currentAnimation != nil &&
			currentAnimation!.animationState == animationState { return }
		
		guard let animation = animations[animationState] else {
			print("Unknown animation for state \(animationState.rawValue)")
			return
		}
		
		node.removeActionForKey(actionKey)
		
		let texturesAction: SKAction
		if animation.repeatTexturesForever {
			texturesAction = SKAction.repeatActionForever(SKAction.animateWithTextures(animation.textures, timePerFrame: timePerFrame))
		}
		else {
			texturesAction = SKAction.animateWithTextures(
				animation.textures, timePerFrame: timePerFrame)
		}
		
		node.runAction(texturesAction, withKey: actionKey)
		
		currentAnimation = animation
	}
}


