extends Resource

class_name CrabMove

enum TARGET {
	SELF,
	ENEMY
}

@export var TargetType : TARGET
@export var MoveName : String
@export var Cost : int
@export var Accuracy : int


func PerformMove(target : CrabUnit):
	print(target.Name + "has been targeted")

func DetermineTarget(crabUnit : CrabUnit):
	if TargetType == TARGET.SELF:
		return crabUnit
	else:
		if crabUnit.bIsEnemy:
			return Helper.GetActivePlayer()
		else:
			return Helper.GetActiveEnemy()

func HasPassedAccuracyCheck():
	var result = randi() % 100
	return result < Accuracy
