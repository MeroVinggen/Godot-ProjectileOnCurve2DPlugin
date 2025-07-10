extends Node
class_name Utils


static func getTrajectoryPoints(startPos: Vector2, targetPos: Vector2, arcHeight: int, pointsAmount: int = 2) -> PackedVector2Array:
	var _traveledTime: float = 0.0

	var distance: float = targetPos.distance_to(startPos)
	var _duration: float = distance / ProjectileOnCurve2D._SPEED

	var mid: Vector2 = (startPos + targetPos) * 0.5
	var curveOffset: Vector2 = Vector2(0, -arcHeight)
	var _control: Vector2 = mid + curveOffset
	var _inv_duration: float = 1.0 / _duration
	
	var trajectoryPoints: PackedVector2Array
	
	for i: int in pointsAmount:
		var stepDelta: float = 0.016
		_traveledTime += stepDelta * _inv_duration

		trajectoryPoints.append(_get_quadratic_bezier_point(startPos, _control, targetPos, _traveledTime))
	
	return trajectoryPoints


static func _get_quadratic_bezier_point(p0: Vector2, p1: Vector2, p2: Vector2, t: float) -> Vector2:
	return (1 - t) * (1 - t) * p0 + 2 * (1 - t) * t * p1 + t * t * p2
