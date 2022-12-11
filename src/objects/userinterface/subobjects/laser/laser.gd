extends CPUParticles2D


@onready var laser_line: Line2D = $LaserLine2D


func _process(_delta: float) -> void:
	# destroy asroids
	if not LaserManager.target:
		emitting = false
		laser_line.visible = false
		return
	
	var global_mouse_position: Vector2 = get_global_mouse_position()
	
	global_position = global_mouse_position
	
	var viewport_rect_size: Vector2 = get_viewport_rect().size
	laser_line.set_point_position(0,to_local(Vector2(viewport_rect_size.x/2.0,viewport_rect_size.y)))
	
	emitting = true
	laser_line.visible = true
