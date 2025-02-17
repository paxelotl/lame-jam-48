extends Camera2D

@onready var player = $"../Player"
@onready var score = $"Score"
var high_score = 0

func _process(delta: float) -> void:
	position.x = player.position.x
	if player.global_position.y < 360:
		position.y = player.position.y
	
	update_score()

func update_score():
	var current_score = (player.position.y - 540) / 360 * -1
	if current_score > high_score:
		high_score = current_score
	score.text = str(floor(high_score))
