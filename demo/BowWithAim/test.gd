extends Control

@export var trajectory_points: int = 50

@onready var direction_marker_2d: Marker2D = $ImmortalAim/DirectionMarker2D
@onready var graviry_text_edit: TextEdit = $graviryTextEdit
@onready var trajectory_line: Line2D = $Line2D
@onready var speed_text_edit_2: TextEdit = $speedTextEdit2
@onready var bowManual: Sprite2D = $ImmortalBow/Bow

var projectile1: PackedScene = load("res://demo/shared/projectile/Projectile3/Projectile3.tscn")
#var projectile1: PackedScene = load("res://demo/shared/projectile/Projectile2/Projectile2.tscn")
var lastMousePos: Vector2


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			shot()


func _physics_process(_delta: float) -> void:
	var curMousePos: Vector2 = get_global_mouse_position()
	
	if curMousePos == lastMousePos:
		return
		
	lastMousePos = curMousePos
	onDataUpdated()


func shot() -> void:
	var newProjectile: ProjectileOnCurve2D = projectile1.instantiate()
	newProjectile.launch(
		bowManual.global_position,
		direction_marker_2d.global_position,
		int(graviry_text_edit.text),
		int(speed_text_edit_2.text),
	)
	add_child.call_deferred(newProjectile)


func onDataUpdated() -> void:
	renderTrajectory(
		bowManual.global_position,
		direction_marker_2d.global_position,
		int(graviry_text_edit.text),
	)
	
	bowManual.look_at(trajectory_line.points[4])


func renderTrajectory(startPos: Vector2, targetPos: Vector2, arcHeight: int, _speed: int = 1) -> void:
	if not trajectory_line:
		return
	
	trajectory_line.clear_points()
	
	for i: Vector2 in Utils.getTrajectoryPoints(
		startPos,
		targetPos,
		arcHeight,
		trajectory_points
	):
		trajectory_line.add_point(i)
