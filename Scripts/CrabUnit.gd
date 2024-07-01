extends Sprite2D

class_name CrabUnit

@export var Name : String
@export var Moves : Array[CrabMove]

var bIsEnemy = false
var Health : HealthComponent

func _ready():
	Health = $HealthComponent
	Health.Setup()

