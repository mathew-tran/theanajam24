@tool

extends ProgressBar

class_name HealthBarUI

@export var bShowEXPBar : bool
@export var bIsEnemy : bool
@onready var NameLabel = $Name
@onready var HealthLabel = $Health

var LastCrab : CrabUnit

func _ready():
	$EXPBar.visible = bShowEXPBar

	if bIsEnemy:
		NameLabel.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	else:
		NameLabel.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT

func Setup(crab: CrabUnit):
	DisconnectPreviousCrab()
	NameLabel.text = crab.Name
	crab.Health.OnDeath.connect(OnDeath)
	crab.Health.OnHeal.connect(OnHeal)
	crab.Health.OnTakeDamage.connect(OnTakeDamage)
	Update(crab.Health)
	LastCrab = crab

func DisconnectPreviousCrab():
	if LastCrab != null:
		LastCrab.Health.OnDeath.disconnect(OnDeath)
		LastCrab.Health.OnHeal.disconnect(OnHeal)
		LastCrab.Health.OnTakeDamage.disconnect(OnTakeDamage)
	LastCrab = null


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
