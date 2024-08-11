extends Node2D
class_name Tower

@export var _projectileSpeed: int
@export var _projectileGravity: float

@onready var _timerNode: Timer = $Timer
@onready var _gravityLabel: Label = $Gravity
@onready var _speedLabel: Label = $Speed

var _projectile: PackedScene
var _target: Node2D


func setProjectile(projectile: PackedScene):
	_projectile = projectile


func _ready() -> void:
	_gravityLabel.text = "gravity: " + str(_projectileGravity)
	_speedLabel.text = "speed: " + str(_projectileSpeed)


# enable shooting
func _on_area_2d_area_entered(area: Area2D) -> void:
	_target = area
	_timerNode.start()


# disable shooting
func _on_area_2d_area_exited(area: Area2D) -> void:
	_timerNode.stop()


# shot tick
func _on_timer_timeout() -> void:
	var newProjectile = _projectile.instantiate()
	newProjectile.launch(global_position, _target.global_position, _projectileGravity, _projectileSpeed)
	owner.add_child(newProjectile)
