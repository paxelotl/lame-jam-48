extends CharacterBody2D

const SPEED = 180.0
@onready var arrow_pivot = $ArrowPivot
@onready var arrow = $ArrowPivot/Arrow

var direction_to_arrow: Vector2

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				launch()

func _physics_process(delta: float) -> void:
	# point arrow towards cursor
	arrow_pivot.look_at(get_global_mouse_position())
	
	# Get dir to arrow
	direction_to_arrow = arrow.global_position - global_position
	
	# Fall down
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle left right input
	var direction := Input.get_axis("move_left", "move_right")
	if is_on_floor():
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED / 3)

	move_and_slide()

func launch():
	if is_on_floor():
		velocity = direction_to_arrow.normalized() * 800
