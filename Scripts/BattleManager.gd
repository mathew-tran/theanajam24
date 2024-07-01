extends Node

@onready var PlayerCircle = $PlayerCircle
@onready var EnemyCircle = $EnemyCircle

func _ready():
	EventManager.PopulatePlayerData.emit(PlayerCircle.get_child(0))
