extends Sprite2D

signal updatedProjectileParams

@export var target: Node2D
@export_category("projectile")
@export var projectileScene: PackedScene
@export var projectileParams: Array[Dictionary]

@onready var timer: Timer = $Timer

var curProjectileParams: Dictionary
var curProjectileParamsIndex: int = 0


func shot() -> void:
	await updateProjectileParams()
	
	var projectile: ProjectileOnCurve2D = projectileScene.instantiate()
	projectile.launch(
		global_position,
		target.global_position,
		curProjectileParams.gravity,
		curProjectileParams.speed,
	)
	owner.add_child(projectile)


func updateProjectileParams() -> void:
	curProjectileParamsIndex += 1
	
	if curProjectileParamsIndex == projectileParams.size():
		curProjectileParamsIndex = 0
	
	curProjectileParams = projectileParams[curProjectileParamsIndex]
	updatedProjectileParams.emit()
	
	look_at(
		 Utils.getTrajectoryPoints(
			global_position,
			target.global_position,
			curProjectileParams.gravity,
			10
		)[1]
	)
	
	# short delay to shot after bow been rotated
	await get_tree().create_timer(0.5).timeout
