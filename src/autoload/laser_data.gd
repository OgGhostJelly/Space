extends Node


@export var damage: float = 1.0
var mouse_touching: Node3D
var fire_action_pressed: bool = false
var target: Node3D


func _unhandled_input(event: InputEvent) -> void:
	# update fire action pressed
	if event.is_action("fire"):
		if event.is_pressed():
			fire_action_pressed = true
		else:
			fire_action_pressed = false
	
	# update target
	if mouse_touching and fire_action_pressed:
		target = mouse_touching
	else:
		target = null


func _ready() -> void:
	# connect targetable nodes
	for node in get_tree().get_nodes_in_group("targetable"):
		var _t = node.mouse_entered.connect(func(): mouse_touching = node)
		_t = node.mouse_exited.connect(func(): mouse_touching = null)
