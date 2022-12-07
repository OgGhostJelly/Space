extends Node3D
class_name Player


@export var terminal_velocity: float = 3.0

@onready var camera: Camera3D = $Camera3D


func _process(delta: float) -> void:
	var input_vector: Vector2 = Input.get_vector(
		"up",
		"down",
		"left",
		"right"
	)
	
	rotate_y(input_vector.y * terminal_velocity * delta)
	
	#print(transform.basis.x)
	#var axis: Vector3 = Vector3(input_vector.x,input_vector.y,0)
	#transform.basis.y #transform.basis.x * input_vector.y if input_vector.y else Vector3(0, 0, input_vector.x).normalized()
	#axis = axis.normalized()
	#if axis:
	#	var pivot_transform: Transform3D = Transform3D(transform.basis, position)
	#	transform = pivot_transform.rotated(axis, terminal_velocity * delta)

