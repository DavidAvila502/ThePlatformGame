extends Node

func enemyDestroySound():
	$destroyEnemy.play()
	await  $destroyEnemy.finished


func smashEnemySound():
	$smashEnemy.play()
	await  $smashEnemy.finished


func playerDieSound():
	$PlayerDieSound.play()
