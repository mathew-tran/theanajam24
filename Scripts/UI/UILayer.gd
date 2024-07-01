extends CanvasLayer

@onready var PlayerHealthBar = $PlayerHealthBar
@onready var EnemyHealthBar = $EnemyHealthBar

func _ready():
	EventManager.PopulatePlayerData.connect(OnPopulatePlayerData)

func OnPopulatePlayerData(crab : CrabUnit):
	PlayerHealthBar.Setup(crab)
