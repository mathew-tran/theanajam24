extends CrabMove

@export var Damage : int
@export var DamageBonus : int
@export var CritChance : int

func PerformMove(target : CrabUnit):
	print(target.Name + "has been attacked")
	var damage = Damage + randi() % (DamageBonus + 1)
	var result = randi() % 100
	if result < CritChance:
		damage *= 1.5
		damage = floor(damage)
		print("CRIT")
	target.Health.TakeDamage(damage)
