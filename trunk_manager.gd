extends Node2D

@onready var player: CharacterBody2D = $"../Player"
@export var trunk: PackedScene

func _ready() -> void:
	spawn_trunk(50)

func spawn_trunk(num: int) -> void:
	for i in range(1, num):
		var instance = trunk.instantiate()
		instance.position = Vector2.ZERO
		instance.position.y -= 360 * i
		add_child(instance)
