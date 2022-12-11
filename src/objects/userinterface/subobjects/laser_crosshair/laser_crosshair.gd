extends Sprite2D


func _process(_delta: float) -> void:
	scale = Vector2.ONE * ( ( sin(Time.get_ticks_msec() / 250.0) + 4 ) / 40 )

	if is_instance_valid(LaserManager.last_target):
		global_position = get_viewport().get_camera_3d().unproject_position(LaserManager.last_target.global_position)
