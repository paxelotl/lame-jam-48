extends CharacterBody2D

const SPEED = 180.0
@onready var arrow_pivot = $ArrowPivot
@onready var arrow = $ArrowPivot/Arrow
@onready var sprite = $Sprite

var direction_to_arrow: Vector2
var jump_power: float = 700

func _physics_process(delta: float) -> void:
	# point arrow towards cursor
	arrow_pivot.look_at(get_global_mouse_position())
	
	# Get dir to arrow
	direction_to_arrow = arrow.global_position - global_position
	
	# Fall down
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Hold to increase jump power
	if Input.is_action_pressed("left_click") and jump_power < 1100:
		jump_power += 300 * delta
	if Input.is_action_just_released("left_click"):
		launch(jump_power)
		jump_power = 700
	
	# Handle left right input
	var direction := Input.get_axis("move_left", "move_right")
	if is_on_floor():
		if direction:
			velocity.x = direction * SPEED
				
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED / 3)
	
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true
	
	move_and_slide()

func launch(power: float):
	if is_on_floor():
		velocity = direction_to_arrow.normalized() * power
