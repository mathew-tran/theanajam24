extends Node

func GetActiveEnemy():
	var circle = get_tree().get_nodes_in_group("EnemyCircle")
	if circle:
		return circle[0].get_child(0)
	return null

func GetActivePlayer():
	var circle = get_tree().get_nodes_in_group("PlayerCircle")
	if circle:
		return circle[0].get_child(0)
	return null
