extends Node

func GetActiveEnemy() -> CrabUnit:
	var circle = get_tree().get_nodes_in_group("EnemyCircle")
	if circle:
		return circle[0].get_child(0)
	return null

func GetActivePlayer() -> CrabUnit:
	var circle = get_tree().get_nodes_in_group("PlayerCircle")
	if circle:
		return circle[0].get_child(0)
	return null

func DoMove(crabUnit : CrabUnit, crabMove : CrabMove):
	if is_instance_valid(crabMove) == false:
		return

	if crabMove.HasPassedAccuracyCheck():
		var target = crabMove.DetermineTarget(crabUnit)
		crabMove.PerformMove(target)
		#Expect the move to give dialogue.
		if crabMove.AnimType == CrabMove.ANIM.MOVE:
			await crabUnit.AnimMove()

		if crabMove.AnimType == CrabMove.ANIM.DANCE:
			await crabUnit.AnimDance()
	else:
		EventManager.InjectBattleLog.emit(crabUnit.Name + "'s move has missed!")



	await EventManager.BattleLogComplete
	EventManager.MoveComplete.emit()

func IsRoundOver():
	var activePlayer = GetActivePlayer()
	var activeEnemy = GetActiveEnemy()

	if activePlayer and activePlayer.Health.IsAlive() == false:
		return true
	if activeEnemy and activeEnemy.Health.IsAlive() == false:
		return true

	return false
