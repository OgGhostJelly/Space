extends Timer


@export var damage: float = 400


func _process(delta: float) -> void:
	if not is_instance_valid(LaserManager.target):
		return
	
	if LaserManager.target.has_method("deal_damage"):
		LaserManager.target.deal_damage(damage * delta)
