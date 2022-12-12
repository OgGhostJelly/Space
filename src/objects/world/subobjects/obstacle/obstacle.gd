extends Area3D
class_name Obstacle

signal health_changed


@export var animation_player: AnimationPlayer
@export var max_health: float = 100.0; var health: float = max_health
@export var damage: float = 10.0


func _enter_tree() -> void:
	add_to_group("targetable")


func deal_damage(damage_dealt: float) -> void:
	health -= damage_dealt
	
	if health <= 0:
		animation_player.play("died")
