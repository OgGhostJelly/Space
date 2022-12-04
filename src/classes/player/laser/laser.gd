extends Node3D


@onready var laser_mesh: MeshInstance3D = $LaserMesh
@onready var laser_visibility_timer: Timer = $LaserVisibilityTimer


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("fire"):
		laser_mesh.visible = true
		laser_visibility_timer.start()


func _on_laser_visibility_timer_timeout() -> void:
	laser_mesh.visible = false
