extends CPUParticles2D


@export var laser_sensitivity: float = 0.25
@onready var laser_line: Line2D = $LaserLine2D
@onready var damage_timer: Timer = $DamageTimer
var previous_global_mouse_position: Vector2


func _process(delta: float) -> void:
	var global_mouse_position: Vector2 = get_global_mouse_position()
	# destroy asroids
	if not Input.is_action_pressed("fire") or not PlanetData.mouse_touching_planet:
		emitting = false
		laser_line.visible = false
		previous_global_mouse_position = global_mouse_position
		return
	
	global_position = global_mouse_position
	
	var viewport_rect_size: Vector2 = get_viewport_rect().size
	laser_line.set_point_position(0,to_local(Vector2(viewport_rect_size.x/2.0,viewport_rect_size.y)))
	
	emitting = true
	laser_line.visible = true
	if previous_global_mouse_position.distance_to(global_mouse_position) * delta > laser_sensitivity and damage_timer.is_stopped():
		damage_timer.start()
		PlanetData.deal_damage()
	
	previous_global_mouse_position = global_mouse_position
