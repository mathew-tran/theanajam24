@tool

extends ProgressBar

class_name HealthBarUI

@export var bShowEXPBar : bool
@export var bIsEnemy : bool
@onready var NameLabel = $Name
@onready var HealthLabel = $Health

var LastCrab : CrabUnit

var LastHealth = 0
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
	LastHealth = crab.Health.Amount
	$DiffBar.value = LastHealth

	LastCrab = crab
	print("Setup UI for " + crab.Name + "for " + str(get_path()))
	Update(crab.Health)

func DisconnectPreviousCrab():
	if LastCrab != null:
		LastCrab.Health.OnDeath.disconnect(OnDeath)
		LastCrab.Health.OnHeal.disconnect(OnHeal)
		LastCrab.Health.OnTakeDamage.disconnect(OnTakeDamage)
	LastCrab = null


func OnHeal(healthComponent):
	Update(healthComponent)

func OnTakeDamage(healthComponent : HealthComponent):
	Update(healthComponent)
	var tween = get_tree().create_tween()
	tween.tween_property($DiffBar,  "value", healthComponent.Amount, .3).set_trans(Tween.TRANS_QUAD)



func OnDeath(healthComponent):
	Update(healthComponent)
	var tween = get_tree().create_tween()
	tween.tween_property($DiffBar,  "value", healthComponent.Amount, .5).set_trans(Tween.TRANS_QUAD)


func Update(healthComponent : HealthComponent):
	if is_instance_valid(LastCrab):
		if LastCrab.Health.IsAlive():
			HealthLabel.text = str(healthComponent.Amount) + "/" + str(healthComponent.MaxHealth)
		else:
			HealthLabel.text = "DEAD"
		max_value = healthComponent.MaxHealth
		$DiffBar.max_value = healthComponent.MaxHealth
		value = healthComponent.Amount
		print(LastCrab.Name + " update")
