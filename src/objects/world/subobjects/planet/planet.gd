extends Area3D
class_name Planet
signal died


@export var max_health: float = 100.0; var health: float = max_health


func _enter_tree() -> void:
	add_to_group("targetable")
	var _t = area_entered.connect(_on_area_entered)


func _on_area_entered(area: Area3D) -> void:
	if area is Obstacle:
		health -= area.damage
		area.deal_damage(area.health)
		
		if health <= 0:
			died.emit()
