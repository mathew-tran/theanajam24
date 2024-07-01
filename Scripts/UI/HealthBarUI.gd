@tool

extends ProgressBar

@export var bShowEXPBar : bool

func _ready():
	$EXPBar.visible = bShowEXPBar
