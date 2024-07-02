extends Panel

var Moves = []

func _ready():
	EventManager.PopulatePlayerData.connect(OnPopulatePlayerData)
	EventManager.InjectBattleLog.connect(OnInjectBattleLog)
	EventManager.BattleLogComplete.connect(OnBattleLogComplete)
	EventManager.PlayerStartAttack.connect(OnPlayerStartAttack)
	EventManager.EnemyTelegraphAbility.connect(OnEnemyTelegraphAbility)
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

func OnInjectBattleLog(_message: String):
	for move in Moves:
		move.SetDisable()

func OnBattleLogComplete():
	for move in Moves:
		move.SetEnable()

func OnPlayerStartAttack():
	visible = false

func OnEnemyTelegraphAbility(_abil : CrabMove):
	visible = true
