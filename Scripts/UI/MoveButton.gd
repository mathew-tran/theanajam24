extends Panel

class_name MoveButton

@onready var MoveName = $Label
@onready var ButtonRef = $Button

var CrabMoveRef : CrabMove
var CrabUnitRef : CrabUnit

func _ready():
	ButtonRef.pressed.connect(OnButtonPressed)

func OnButtonPressed():
	if is_instance_valid(CrabMoveRef) == false:
		return

	if CrabMoveRef.HasPassedAccuracyCheck():
		var target = CrabMoveRef.DetermineTarget(CrabUnitRef)
		CrabMoveRef.PerformMove(target)
	else:
		EventManager.InjectBattleLog.emit(CrabUnitRef.Name + "'s move has missed!")

func Setup(move : CrabMove, crab : CrabUnit):
	ButtonRef.disabled = true
	MoveName.text = "-"
	CrabMoveRef = null
	CrabUnitRef = null
	if is_instance_valid(move):
		ButtonRef.disabled = false
		MoveName.text = move.MoveName
		CrabMoveRef = move
		CrabUnitRef = crab

func SetDisable():
	ButtonRef.disabled = true
	MoveName.modulate = Color.DIM_GRAY

func SetEnable():
	if is_instance_valid(CrabMoveRef) == false:
		return
	ButtonRef.disabled = false
	MoveName.modulate = Color.WHITE
