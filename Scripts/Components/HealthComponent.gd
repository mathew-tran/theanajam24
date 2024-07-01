extends Node

class_name HealthComponent

@export var Amount : int

var MaxHealth = 0

signal OnHeal(healthComponent)
signal OnTakeDamage(healthComponent)
signal OnDeath(healthComponent)

func Setup():
	MaxHealth = Amount

func IsAlive():
	return Amount > 0

func TakeDamage(amount):
	Amount -= amount

func Heal(amount):
	Amount += amount
	if Amount < 0:
		Amount = 0
