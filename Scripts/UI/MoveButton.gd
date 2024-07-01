extends Panel

class_name MoveButton

@onready var MoveName = $Label
@onready var ButtonRef = $Button

var CrabMoveRef : CrabMove

func _ready():
	ButtonRef.pressed.connect(OnButtonPressed)

func OnButtonPressed():
	if is_instance_valid(CrabMoveRef) == false:
		return

	CrabMoveRef.PerformMove()

func Setup(move : CrabMove):
	ButtonRef.disabled = true
	MoveName.text = "-"
	CrabMoveRef = null
	if is_instance_valid(move):
		ButtonRef.disabled = false
		MoveName.text = move.MoveName
		CrabMoveRef = move

