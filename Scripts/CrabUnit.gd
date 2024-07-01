extends Sprite2D

class_name CrabUnit

@export var Name : String
@export var Moves : Array[CrabMove]
@export var Health : HealthComponent

func _ready():
	Health.Setup()
