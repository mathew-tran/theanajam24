extends Node

signal PopulatePlayerData(crab : CrabUnit)
signal PopulateEnemyData(crab : CrabUnit)
signal InjectBattleLog(message: String)
signal BattleLogComplete()
signal StartEnemyTurn
signal CompleteEnemyTurn
signal EnemyTelegraphAbility(abil : CrabUnit)
