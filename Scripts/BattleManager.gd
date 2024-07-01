extends Node

@onready var PlayerCircle = $PlayerCircle
@onready var EnemyCircle = $EnemyCircle

func _ready():
	EventManager.PopulateMovePanel.emit(PlayerCircle.get_child(0))
