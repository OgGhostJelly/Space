extends Timer


func _ready() -> void:
	LaserManager.target_changed.connect(_on_laser_target_changed)


func _on_laser_target_changed() -> void:
	if LaserManager.target:
		start()
	else:
		stop()


func _on_timeout() -> void:
	if LaserManager.target.has_method("_damaged_by_laser"):
		LaserManager.target._damaged_by_laser
