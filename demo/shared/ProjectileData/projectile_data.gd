extends Control

@export var projectileShoter: Node

@onready var gravityLabel: Label = $Vbox/HBoxContainer/gravityLabel
@onready var speedLabel: Label = $Vbox/HBoxContainer2/speedLabel


func _ready() -> void:
	projectileShoter.updatedProjectileParams.connect(pringData)


func pringData() -> void:
	gravityLabel.text = str(projectileShoter.curProjectileParams.gravity)
	speedLabel.text = str(projectileShoter.curProjectileParams.speed)
