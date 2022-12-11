extends Area3D
class_name Obstacle

signal health_changed


@export var animation_player: AnimationPlayer
@export var max_health: float = 100.0; @onready var health: float = max_health


func _enter_tree() -> void:
	add_to_group("targetable")


func _damaged_by_laser(damage: float) -> void:
	health -= damage
	
	if health <= 0:
		animation_player.play("died")


func destroy() -> void:
	pass
