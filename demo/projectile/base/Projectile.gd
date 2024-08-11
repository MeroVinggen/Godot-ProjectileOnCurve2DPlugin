extends Area2D


func _on_area_entered(area: Area2D) -> void:
	print("hit")
	owner.queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("out")
	owner.queue_free()
