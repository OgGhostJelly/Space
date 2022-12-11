extends Area3D
class_name Planet


func _enter_tree() -> void:
	add_to_group("targetable")


func _on_area_entered(area: Area3D) -> void:
	if area is Obstacle:
		area.destroy()
