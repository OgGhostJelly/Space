extends Node3D


@export var obstacle: PackedScene


func _on_obstacle_spawn_timer_timeout() -> void:
	var obj: Area2D = obstacle.instantiate()
	add_child(obj)
