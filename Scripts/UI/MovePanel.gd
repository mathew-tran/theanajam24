extends Panel

var Moves = []

func _ready():
	EventManager.PopulatePlayerData.connect(OnPopulatePlayerData)
	for child in $VBoxContainer/HBoxContainer.get_children():
		Moves.append(child)
	for child in $VBoxContainer/HBoxContainer2.get_children():
		Moves.append(child)

func OnPopulatePlayerData(crab : CrabUnit):
	for x in range(0, len(Moves)):
		if len(crab.Moves) > x:
			Moves[x].Setup(crab.Moves[x], crab)
		else:
			Moves[x].Setup(null, null)
