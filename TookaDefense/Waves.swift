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
	
	let newWaveHandler: (waveNum: Int) -> Void
	let newEnemyHandler: (mobType: EnemyType) -> Void // importe une fonction pour ajouter un ennemi de tel type
	
	init(waves: [Wave], newWaveHandler: (waveNum: Int) -> Void, newEnemyHandler: (enemyType: EnemyType) -> Void) {
		self.waves = waves
		self.newWaveHandler = newWaveHandler
		self.newEnemyHandler = newEnemyHandler
	}
	
	func startNextWave() -> Bool {
		if waves.count <= currentWave {
			return true
		}
		self.newWaveHandler(waveNum: currentWave+1)
		
		let wave = waves[currentWave]
		currentWaveEnemyCount = wave.enemyCount
		for m in 1...wave.enemyCount {
			delay(wave.enemyDelay * Double(m), closure: { () -> () in
				self.newEnemyHandler(mobType: wave.enemyType)
			})
		}
		currentWave++
		
		return false
	}
	
	func removeEnemyFromWave() -> Bool {
		if --currentWaveEnemyCount <= 0 {
			return startNextWave()
		}
		return false
	}
	
}


