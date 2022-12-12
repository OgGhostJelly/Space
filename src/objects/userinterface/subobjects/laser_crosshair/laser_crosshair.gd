extends ProgressBar
var last_target_last_pos: Vector3
func _process(_delta: float) -> void:
	position = get_viewport().get_camera_3d().unproject_position(last_target_last_pos).round()
	position += -size*0.5
	
	if not is_instance_valid(LaserManager.last_target):
		return
	
	visible = true
	last_target_last_pos = LaserManager.last_target.global_position
	
	if not LaserManager.last_target is Obstacle:
		value = max_value
		return
	
	max_value = LaserManager.last_target.max_health
	value = LaserManager.last_target.health
