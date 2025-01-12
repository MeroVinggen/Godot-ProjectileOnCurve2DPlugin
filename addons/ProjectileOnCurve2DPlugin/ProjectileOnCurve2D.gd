extends Node2D
class_name ProjectileOnCurve2D

const _SPEED = 100
var _gravity: float
var _velocity: Vector2
var _stepAmount: int
var _gravityStepCache: float


func move() -> void:
	set_physics_process(true)


func stop() -> void:
	set_physics_process(false)


func launch(startPos: Vector2, targetPos: Vector2, gravity: float, stepAmount: int = 1) -> void:
	_gravity = gravity
	_stepAmount = stepAmount

	var distance = targetPos - startPos
	var time = distance.length() / _SPEED
	_velocity = distance / time + Vector2(0, -_gravity * time / 2)
	position = startPos
	rotation = _velocity.angle()
	
	_gravityStepCache = _gravity * _stepAmount
	
	if _velocity.x < 0:
		scale.y = -1
	else:
		scale.y = 1


func _physics_process(delta):
	_velocity.y += _gravityStepCache * delta
	position += _velocity * delta * _stepAmount
	
	rotation = _velocity.angle()
