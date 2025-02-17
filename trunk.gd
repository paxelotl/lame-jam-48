extends Node2D

@onready var branch_collider = $BranchPivot/Branch
@onready var branch_sprite = $BranchPivot/Branch/Sprite

func _ready() -> void:
	var flip = randi_range(0, 1)
	if(flip):
		branch_collider.position.x *= -1
		branch_sprite.scale.x *= -1
