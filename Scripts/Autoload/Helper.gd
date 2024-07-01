extends Node

func GetEnemy():
	var circle = get_tree().get_nodes_in_group("EnemyCircle")
	if circle:
		return circle[0].get_child(0)
