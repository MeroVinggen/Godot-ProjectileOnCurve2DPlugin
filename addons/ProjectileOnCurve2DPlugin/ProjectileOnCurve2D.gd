extends Node2D
class_name ProjectileOnCurve2D

# movement per pixel
const _SPEED: int = 100
var _startPos: Vector2
var _endPos: Vector2
var _control: Vector2
# 0.0 - 1.0
var _traveledTime: float = 0.0
var _duration: float
var _inv_duration: float
var _speed: int = 1


func move() -> void:
	set_physics_process(true)


func stop() -> void:
	set_physics_process(false)


func launch(startPos: Vector2, targetPos: Vector2, arcHeight: int, speed: int = 1) -> void:
	_startPos = startPos
	_endPos = targetPos
	_speed = speed
	position = _startPos
	_traveledTime = 0.0

	var distance: float = _endPos.distance_to(_startPos)
	_duration = distance / _SPEED

	var mid: Vector2 = (_startPos + _endPos) * 0.5
	var curveOffset: Vector2 = Vector2(0, -arcHeight)
	_control = mid + curveOffset
	_inv_duration = 1.0 / _duration
	
	scale.y = -abs(scale.y) if targetPos.x < startPos.x else abs(scale.y)
	
	step(0.0)


func _physics_process(delta: float) -> void:
	step(delta)


func step(delta: float) -> void:
	var stepDelta: float = delta * _speed
	_traveledTime += stepDelta * _inv_duration

	position = _get_quadratic_bezier_point(_startPos, _control, _endPos, _traveledTime)
	var dir: Vector2 = _get_quadratic_bezier_tangent(_startPos, _control, _endPos, _traveledTime).normalized()
	rotation = dir.angle()
	

func _get_quadratic_bezier_point(p0: Vector2, p1: Vector2, p2: Vector2, t: float) -> Vector2:
	return (1 - t) * (1 - t) * p0 + 2 * (1 - t) * t * p1 + t * t * p2


func _get_quadratic_bezier_tangent(p0: Vector2, p1: Vector2, p2: Vector2, t: float) -> Vector2:
	return 2 * (1 - t) * (p1 - p0) + 2 * t * (p2 - p1)
