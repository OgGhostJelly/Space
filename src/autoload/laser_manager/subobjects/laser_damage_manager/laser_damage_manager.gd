extends Timer


@export var damage: float = 400


func _process(delta: float) -> void:
	if not is_instance_valid(LaserManager.target):
		return
	
	if LaserManager.target.has_method("_damaged_by_laser"):
		LaserManager.target._damaged_by_laser(damage * delta)
