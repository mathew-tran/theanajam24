extends Node

var NextMoveToUse : CrabMove

func _ready():
	EventManager.StartEnemyTurn.connect(OnStartEnemyTurn)
	EventManager.CompleteEnemyTurn.connect(OnCompleteEnemyTurn)

func OnStartEnemyTurn():
	var enemy = Helper.GetActiveEnemy()
	enemy.bIsEnemy = true
	if enemy.Health.IsAlive() == false:
		EventManager.EnemyTelegraphAbility.emit(null)
		return
	NextMoveToUse = enemy.GetRandomMove()
	EventManager.EnemyTelegraphAbility.emit(NextMoveToUse)

func OnCompleteEnemyTurn():
	var enemy = Helper.GetActiveEnemy()
	if enemy.Health.IsAlive():
		Helper.DoMove(enemy, NextMoveToUse)
		NextMoveToUse = null
	else:
		EventManager.EnemyTelegraphAbility.emit(null)
