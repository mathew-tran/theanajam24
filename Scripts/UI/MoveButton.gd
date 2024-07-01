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
		print("MISSED!")

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

