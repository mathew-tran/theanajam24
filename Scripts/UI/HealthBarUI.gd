@tool

extends ProgressBar

class_name HealthBarUI

@export var bShowEXPBar : bool
@onready var NameLabel = $Name
@onready var HealthLabel = $Health

func _ready():
	$EXPBar.visible = bShowEXPBar

func Setup(crab: CrabUnit):
	NameLabel.text = crab.Name
	crab.Health.OnDeath.connect(OnDeath)
	crab.Health.OnHeal.connect(OnHeal)
	crab.Health.OnTakeDamage.connect(OnTakeDamage)
	Update(crab.Health)

func OnHeal(healthComponent):
	Update(healthComponent)

func OnTakeDamage(healthComponent):
	Update(healthComponent)


func OnDeath(healthComponent):
	Update(healthComponent)


func Update(healthComponent : HealthComponent):
	HealthLabel.text = str(healthComponent.Amount) + "/" + str(healthComponent.MaxHealth)
	max_value = healthComponent.MaxHealth
	value = healthComponent.Amount
