extends Node3D
class_name Player


@export var terminal_velocity: float = 0.5
@export var acceleration: float = 0.25
@export var friction: float = 0.25
@export var radius: float = 2.6
@export var y_pos: float = 2.0

var velocity: float


func _ready() -> void:
	position.x = cos(Vector2.ZERO.x) * radius
	position.y = y_pos
	position.z = sin(Vector2.ZERO.y) * radius


func _process(delta: float) -> void:
	# get the player input and change the velocity accordingly
	var input_vector: int = int(Input.is_action_pressed("left")) - int(Input.is_action_pressed("right"))
	if input_vector:
		velocity = move_toward(velocity, terminal_velocity * input_vector, acceleration * delta)
	else:
		velocity = move_toward(velocity, 0, friction * delta)
	print(velocity)
	# move to the correct position around the center
	var angle: float = atan2(position.z,position.x)
	position.x = cos(angle + (velocity)) * radius
	position.z = sin(angle + (velocity)) * radius
	
	# look at the center
	look_at(Vector3.ZERO)
