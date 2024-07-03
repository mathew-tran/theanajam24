extends Panel


var TargetXPosition = 0
var bIsActive = false

var Messages = []

# Called when the node enters the scene tree for the first time.
func _ready():
	EventManager.InjectBattleLog.connect(OnInjectBattleLog)
	TargetXPosition = position.x
	FlyAwayAnim()

func FlyInAnim():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position:x", TargetXPosition, .2)

func FlyAwayAnim():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position:x", 20000, .2)
	return tween

func OnInjectBattleLog(message: String):
	if bIsActive:
		Messages.append(message)
		return
	$Label.text = message
	FlyInAnim()
	bIsActive = true

func _input(event):
	if event.is_action_released("mouse_click"):
		if bIsActive:
			var tween = FlyAwayAnim()
			tween.tween_callback(OnFlyAwayComplete)


func OnFlyAwayComplete():
	if len(Messages) > 0:
		$Label.text = Messages.pop_back()
		FlyInAnim()
		return
	EventManager.BattleLogComplete.emit()
	bIsActive = false

