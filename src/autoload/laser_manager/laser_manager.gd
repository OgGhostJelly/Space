extends Node

signal target_changed
signal last_target_changed


var mouse_touching: Node3D
var fire_action_pressed: bool = false
var target: Node3D: set = target_setter
var last_target: Node3D: set = last_target_setter


func _ready() -> void:
	# connect targetable nodes
	for node in get_tree().get_nodes_in_group("targetable"):
		var _t = node.mouse_entered.connect(func(): mouse_touching = node)
		_t = node.mouse_exited.connect(func(): mouse_touching = null)


func _unhandled_input(event: InputEvent) -> void:
	# update fire action pressed
	if event.is_action("fire"):
		if event.is_pressed():
			fire_action_pressed = true
		else:
			fire_action_pressed = false
	
	update_target()


func update_target() -> void:
	# update target
	if fire_action_pressed:
		target = mouse_touching
		
		# update last_target
		last_target = mouse_touching
	else:
		target = null


func target_setter(value) -> void:
	if target != value:
		target = value
		target_changed.emit()


func last_target_setter(value) -> void:
	if target and last_target != value:
		last_target = value
		last_target_changed.emit()
