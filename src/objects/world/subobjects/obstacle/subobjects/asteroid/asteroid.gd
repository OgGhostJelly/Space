extends Obstacle


@export var speed: float = 0.7


func _physics_process(delta: float) -> void:
	global_position = global_position.move_toward(Vector3.ZERO, speed * delta)
