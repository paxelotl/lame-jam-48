extends Node2D

@onready var player: CharacterBody2D = $"../Player"

func _process(delta: float) -> void:
	position.y = player.position.y
