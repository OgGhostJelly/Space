extends CPUParticles2D


@onready var laser_line: Line2D = $LaserLine2D


func _process(_delta: float) -> void:
	if not Input.is_action_pressed("fire") or not PlanetData.mouse_touching_planet:
		visible = false
		return
	
	var global_mouse_position: Vector2 = get_global_mouse_position()
	
	global_position = global_mouse_position
	
	var viewport_rect_size: Vector2 = get_viewport_rect().size
	laser_line.set_point_position(0,to_local(Vector2(viewport_rect_size.x/2.0,viewport_rect_size.y)))
	
	visible = true
