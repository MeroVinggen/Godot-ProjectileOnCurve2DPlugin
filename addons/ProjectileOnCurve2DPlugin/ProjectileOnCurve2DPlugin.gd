@tool
extends EditorPlugin


func _enter_tree():
	add_custom_type(
		"ProjectileOnCurve2D", 
		"Node2D", 
		load("res://addons/ProjectileOnCurve2DPlugin/ProjectileOnCurve2D.gd"), 
		load("res://addons/ProjectileOnCurve2DPlugin/node icon.svg")
	)


func _exit_tree():
	remove_custom_type("ProjectileOnCurve2D")
