extends Sprite2D

@onready var _animationPlayer: AnimationPlayer = $AnimationPlayer


func onCollision(_area: Area2D) -> void:
	_animationPlayer.play("blink")
