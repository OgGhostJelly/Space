extends ProgressBar


func _process(_delta: float) -> void:
	if not is_instance_valid(LaserManager.last_target):
		return
	
	position = get_viewport().get_camera_3d().unproject_position(LaserManager.last_target.global_position)
	position += -size*0.5
	
	if not LaserManager.last_target is Obstacle:
		return
	
	max_value = LaserManager.last_target.max_health
	value = LaserManager.last_target.health
