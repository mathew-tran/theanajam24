extends CanvasLayer

@onready var PlayerHealthBar = $PlayerHealthBar
@onready var EnemyHealthBar = $EnemyHealthBar

func _ready():
	EventManager.PopulatePlayerData.connect(OnPopulatePlayerData)
	EventManager.PopulateEnemyData.connect(OnPopulateEnemyData)

func OnPopulatePlayerData(crab : CrabUnit):
	PlayerHealthBar.Setup(crab)

func OnPopulateEnemyData(crab : CrabUnit):
	EnemyHealthBar.Setup(crab)
