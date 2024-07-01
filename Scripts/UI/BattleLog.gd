extends Panel


var TargetXPosition = 0
var bIsActive = false
# Called when the node enters the scene tree for the first time.
func _ready():
	EventManager.InjectBattleLog.connect(OnInjectBattleLog)
	TargetXPosition = position.x
	FlyAwayAnim()

func FlyAwayAnim():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position:x", 20000, .5)
	return tween

func OnInjectBattleLog(message: String):
	$Label.text = message
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position:x", TargetXPosition, .2)
	bIsActive = true

func _input(event):
	if event.is_action_released("mouse_click"):
		if bIsActive:
			var tween = FlyAwayAnim()
			tween.tween_callback(OnFlyAwayComplete)
			bIsActive = false

func OnFlyAwayComplete():
	EventManager.BattleLogComplete.emit()
