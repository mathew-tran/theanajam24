extends Panel

class_name MoveButton

@onready var MoveName = $Label
@onready var MoveDescription = $Description
@onready var ButtonRef = $Button

var CrabMoveRef : CrabMove
var CrabUnitRef : CrabUnit

func _ready():
	ButtonRef.pressed.connect(OnButtonPressed)

func OnButtonPressed():
	ButtonRef.release_focus()
	if is_instance_valid(CrabMoveRef) == false:
		return

	EventManager.PlayerStartAttack.emit()
	Helper.DoMove(CrabUnitRef, CrabMoveRef)
	await EventManager.MoveComplete
	await get_tree().process_frame

	EventManager.CompleteEnemyTurn.emit()

func Setup(move : CrabMove, crab : CrabUnit):
	ButtonRef.disabled = true
	MoveName.text = "-"
	MoveDescription.text = ""
	CrabMoveRef = null
	CrabUnitRef = null
	modulate = Color.GRAY
	_on_button_mouse_exited()
	if is_instance_valid(move):
		modulate = Color.WHITE
		ButtonRef.disabled = false
		MoveName.text = move.MoveName.to_upper()
		MoveDescription.text = move.MoveDescription
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

func _on_button_mouse_entered():
	MoveDescription.visible = true

func _on_button_mouse_exited():
	MoveDescription.visible = false
