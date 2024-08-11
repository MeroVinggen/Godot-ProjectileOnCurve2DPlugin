extends Node2D

@onready var tower: Tower = $Tower
@onready var tower2: Tower = $Tower2
@onready var tower3: Tower = $Tower3
@onready var tower4: Tower = $Tower4

var projectile1 = load("res://demo/projectile/Projectile1/projectile1.tscn")
var projectile2 = load("res://demo/projectile/Projectile2/Projectile2.tscn")


func _ready() -> void:
	tower.setProjectile(projectile1)
	tower2.setProjectile(projectile1)
	tower3.setProjectile(projectile2)
	tower4.setProjectile(projectile2)
