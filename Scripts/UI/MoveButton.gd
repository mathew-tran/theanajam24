extends Panel

class_name MoveButton

@onready var MoveName = $Label
@onready var ButtonRef = $Button
func Setup(move : CrabMove):
	$Button.disabled = true
	MoveName.text = "-"
	if is_instance_valid(move):
		$Button.disabled = false
		MoveName.text = move.MoveName
