extends Node


@export var health: float = 300.0
@export var damage: float = 1.0
var mouse_touching_planet: bool


func deal_damage() -> void:
	health -= damage
	print(health)
