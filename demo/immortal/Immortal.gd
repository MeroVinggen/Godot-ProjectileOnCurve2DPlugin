extends Node2D

var _mouseOffset: Vector2
var _selected: bool


func _physics_process(_delta):
	if _selected:
		position = get_global_mouse_position() + _mouseOffset


func _on_Area2D_input(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			_mouseOffset = position - get_global_mouse_position()
			_selected = true
		else: 
			_selected = false
