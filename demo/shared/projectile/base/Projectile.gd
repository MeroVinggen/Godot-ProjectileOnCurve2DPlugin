extends Area2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


func _on_area_entered(_area: Area2D) -> void:
	if _area.has_meta("type"):
		if _area.get_meta("type") == "ground":
			collision_shape_2d.set_deferred("disabled", true)
			owner.stop()
			await get_tree().create_timer(1).timeout
		
	owner.queue_free()
