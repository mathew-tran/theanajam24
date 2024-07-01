extends CrabMove

@export var Damage : int

func PerformMove(target : CrabUnit):
	print(target.Name + "has been attacked")
	target.Health.TakeDamage(Damage)
