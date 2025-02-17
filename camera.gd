extends Camera2D

@onready var player = $"../Player"

func _process(delta: float) -> void:
	position.x = player.position.x
	if player.global_position.y < 360:
		position.y = player.position.y
