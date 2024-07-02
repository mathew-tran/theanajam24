extends Sprite2D

class_name CrabUnit

@export var Name : String
@export var Moves : Array[CrabMove]

var bIsEnemy = false
var Health : HealthComponent

func _ready():
	Health = $HealthComponent
	Health.Setup()
	Name = Name.to_upper()
	Health.OnTakeDamage.connect(OnPlayerTakeDamage)
	Health.OnDeath.connect(OnPlayerDeath)

func GetRandomMove():
	return Moves[randi() % len(Moves)]

func OnPlayerTakeDamage(_healthComponent: HealthComponent):
	AnimCrabHit()

func OnPlayerDeath(_healthComponent: HealthComponent):
	AnimCrabDead()

func AnimMove():
	var tween = get_tree().create_tween()
	var originalX = position.x
	if bIsEnemy:
		tween.tween_property(self, "position:x", position.x - 20, .1).set_trans(Tween.TRANS_BACK)
	else:
		tween.tween_property(self, "position:x", position.x + 20, .1).set_trans(Tween.TRANS_BACK)
	await tween.finished

	tween = get_tree().create_tween()
	tween.tween_property(self, "position:x", originalX, .1).set_trans(Tween.TRANS_BACK)
	await tween.finished

func AnimCrabHit():

	var flicker = 3
	var total_intervals = flicker * 2

	for i in range(total_intervals):
		var alpha = 0.0 if i % 2 == 0 else 1.0
		var tween = get_tree().create_tween()
		tween.tween_property(self, "modulate:a", alpha, .1)
		await tween.finished

func AnimCrabDead():
	var rotationTarget = -90
	if bIsEnemy:
		rotationTarget = 90
	var tween = get_tree().create_tween()
	tween.tween_property(self, "rotation_degrees", rotationTarget, .1)
	tween.tween_property(self, "position:y", position.y + 10, .1)
	await tween.finished
	tween = get_tree().create_tween()
	tween.tween_property(self, "position:y", position.y - 10, .1)
