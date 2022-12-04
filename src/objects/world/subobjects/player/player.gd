extends Node3D
class_name Player


@export var radius: float = 2.6
@export var speed: float = 0.5
@export var y_pos: float = 2.0


func _process(_delta: float) -> void:
	var time_seconds = ( Time.get_ticks_msec() / 1000.0 )
	
	position.x = cos(time_seconds * speed) * radius
	position.y = y_pos
	position.z = sin(time_seconds * speed) * radius
	
	look_at(Vector3.ZERO)
