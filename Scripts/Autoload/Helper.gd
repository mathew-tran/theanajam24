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

func DoMove(crabUnit, crabMove):
	if is_instance_valid(crabMove) == false:
		return

	if crabMove.HasPassedAccuracyCheck():
		var target = crabMove.DetermineTarget(crabUnit)
		crabMove.PerformMove(target)
	else:
		EventManager.InjectBattleLog.emit(crabUnit.Name + "'s move has missed!")
