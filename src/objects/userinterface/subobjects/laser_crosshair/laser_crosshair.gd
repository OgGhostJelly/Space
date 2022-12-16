extends ProgressBar
var last_target_last_pos: Vector3
func _process(_delta: float) -> void:
	if is_instance_valid(LaserManager.last_target):
		# update last_target_last_pos
		last_target_last_pos = LaserManager.last_target.global_position
		
		if LaserManager.last_target.get('health') and LaserManager.last_target.get('max_health'):
			# set to same values as last_target
			max_value = LaserManager.last_target.max_health
			value = LaserManager.last_target.health
		else:
			# default to regular value
			value = max_value
		
		# show if targeting
		visible = true
	
	# update position
	position = get_viewport().get_camera_3d().unproject_position(last_target_last_pos).round()
	position += -size*0.5
