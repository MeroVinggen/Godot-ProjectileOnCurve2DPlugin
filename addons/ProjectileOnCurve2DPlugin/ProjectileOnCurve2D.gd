extends Node2D
class_name ProjectileOnCurve2D

const _speed = 100
var _gravity: float
var _velocity: Vector2
var _stepAmount: int


func launch(startPos: Vector2, targetPos: Vector2, grav: float, stepAmount: int = 1) -> void:
	_gravity = grav
	_stepAmount = stepAmount

	var distance = targetPos - startPos
	var time = distance.length() / _speed
	_velocity = distance / time + Vector2(0, -_gravity * time / 2)
	position = startPos
	rotation = _velocity.angle()


func _physics_process(delta):
	for i in range(_stepAmount):
		_velocity.y += _gravity * delta
		position += _velocity * delta
	rotation = _velocity.angle()
