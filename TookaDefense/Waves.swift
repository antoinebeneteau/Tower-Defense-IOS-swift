//
//  Waves.swift
//  TookaDefense
//

import Foundation

struct Wave {
	let enemyCount: Int
	let enemyDelay: Double
	let enemyType: EnemyType
}

class WaveManager {
	
	var currentWave = 0
	var currentWaveEnemyCount = 0
	
	let waves: [Wave]
	
	let newWaveHandler: (_ waveNum: Int) -> Void
	let newEnemyHandler: (_ mobType: EnemyType) -> Void // importe une fonction pour ajouter un ennemi de tel type
	
	init(waves: [Wave], newWaveHandler: @escaping (_ waveNum: Int) -> Void, newEnemyHandler: @escaping (_ enemyType: EnemyType) -> Void) {
		self.waves = waves
		self.newWaveHandler = newWaveHandler
		self.newEnemyHandler = newEnemyHandler
	}
	
	func startNextWave() -> Bool {
		if waves.count <= currentWave {
			return true
		}
		self.newWaveHandler(currentWave+1)
		
		let wave = waves[currentWave]
		currentWaveEnemyCount = wave.enemyCount
		for m in 1...wave.enemyCount {
			delay(wave.enemyDelay * Double(m), closure: { () -> () in
				self.newEnemyHandler(wave.enemyType)
			})
		}
		currentWave += 1
		
		return false
	}
	
	func removeEnemyFromWave() -> Bool {
		currentWaveEnemyCount -= 1
		if currentWaveEnemyCount <= 0 {
			return startNextWave()
		}
		return false
	}
	
}


