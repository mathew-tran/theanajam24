extends Panel

var OriginalScale = Vector2.ZERO
@onready var AbilityLabel = $VBoxContainer/Label2

var TelegraphTween = null
func _ready():
	EventManager.StartEnemyTurn.connect(OnStartEnemyTurn)
	EventManager.EnemyTelegraphAbility.connect(OnEnemyTelegraphAbility)
	EventManager.CompleteEnemyTurn.connect(OnCompleteEnemyTurn)
	OriginalScale = scale

func OnEnemyTelegraphAbility(ability: CrabMove):
	if is_instance_valid(ability):
		AbilityLabel.text = ability.MoveName
		AnimIn()
	else:
		AnimOut()

func OnStartEnemyTurn():
	AnimOut()

func OnCompleteEnemyTurn():
	AnimOut()

func AnimIn():
	if is_instance_valid(TelegraphTween):
		TelegraphTween.stop()
	TelegraphTween = get_tree().create_tween()
	TelegraphTween.tween_property(self, "scale", OriginalScale, .1)

func AnimOut():
	if is_instance_valid(TelegraphTween):
		TelegraphTween.stop()
	TelegraphTween = get_tree().create_tween()
	TelegraphTween.tween_property(self, "scale", Vector2(OriginalScale.x, 0), .1)
