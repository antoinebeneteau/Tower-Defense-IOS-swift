//
//  Utils.swift
//  TookaDefense
//
//  Created by Antoine Beneteau on 10/11/2015.
//

import CoreGraphics
import simd
import SpriteKit

// Points et vecteurs
extension CGPoint {
	init(_ point: float2) {
		x = CGFloat(point.x)
		y = CGFloat(point.y)
	}
}
extension float2 {
	init(_ point: CGPoint) {
		self.init(x: Float(point.x), y: Float(point.y))
	}
	
	func distanceTo(point: float2) -> Float {
		let xDist = self.x - point.x
		let yDist = self.y - point.y
		return sqrt((xDist*xDist) + (yDist*yDist))
	}
}

// Tourner node pour faire face à un autre
extension SKNode {
	func rotateToFaceNode(targetNode: SKNode, sourceNode: SKNode) {
		print("Source position: \(sourceNode.position)")
		print("Target position: \(targetNode.position)")
		let angle = atan2(targetNode.position.y - sourceNode.position.y, targetNode.position.x - sourceNode.position.x) - CGFloat(M_PI/2)
		print("Angle: \(angle)")
		self.runAction(SKAction.rotateToAngle(angle, duration: 0))
	}
}

// Delai entre vagues obj
func delay(delay:Double, closure:()->()) {
	dispatch_after(
		dispatch_time(
			DISPATCH_TIME_NOW,
			Int64(delay * Double(NSEC_PER_SEC))
		),
		dispatch_get_main_queue(), closure)
}

// Distance entre deux nodes
func distanceBetween(nodeA: SKNode, nodeB: SKNode) -> CGFloat {
	return CGFloat(hypotf(Float(nodeB.position.x - nodeA.position.x), Float(nodeB.position.y - nodeA.position.y)));
}

// Extensions degree et radian
let π = CGFloat(M_PI)
public extension Int {
	public func degreesToRadians() -> CGFloat {
		return CGFloat(self).degreesToRadians()
	}
}
public extension CGFloat {
	public func degreesToRadians() -> CGFloat {
		return π * self / 180.0
	}
	public func radiansToDegrees() -> CGFloat {
		return self * 180.0 / π
	}
}

