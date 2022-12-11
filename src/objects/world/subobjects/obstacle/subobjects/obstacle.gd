extends Area3D
class_name Obstacle


@export var animation_player: AnimationPlayer


func _enter_tree() -> void:
	add_to_group("targetable")


func _shot_by_laser() -> void:
	animation_player.play("died")
