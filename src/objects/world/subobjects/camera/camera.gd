extends Camera3D
class_name Camera


@export var terminal_velocity: float = 5.0
@export var acceleration: float = 10.0
@export var friction: float = 15.0
var velocity: float
var radius: float = 2.6
var y_pos: float = 2.0


func _process(delta: float) -> void:
	var input_vector: Vector2 = Input.get_vector(
		"left",
		"right",
		"up",
		"down"
	)
	
	if input_vector:
		velocity = move_toward(velocity, terminal_velocity * -input_vector.x, acceleration * delta)
	else:
		velocity = move_toward(velocity, 0, friction * delta)
	
	if velocity:
		# update mouse
		var mouse_event = InputEventMouseMotion.new()
		mouse_event.position = get_viewport().get_mouse_position()
		Input.parse_input_event(mouse_event)
	
	var angle: float = atan2(position.z, position.x)
	position.x = cos(angle + (velocity * delta)) * radius
	position.y = y_pos
	position.z = sin(angle + (velocity * delta)) * radius
	
	look_at(Vector3.ZERO)
