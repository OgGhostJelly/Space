extends VBoxContainer
@onready var target_label: Label = $Target
@onready var last_target_label: Label = $LastTarget
@onready var mouse_touching_label: Label = $MouseTouching
@onready var fire_action_pressed_label: Label = $FireActionPressed
@onready var target_display_text: = target_label.text
@onready var last_target_display_text: = last_target_label.text
@onready var mouse_touching_display_text: = mouse_touching_label.text
@onready var fire_action_pressed_display_text: = fire_action_pressed_label.text
func _process(_delta: float) -> void:
	target_label.text = target_display_text % LaserManager.target
	last_target_label.text = last_target_display_text % LaserManager.last_target
	mouse_touching_label.text = mouse_touching_display_text % LaserManager.mouse_touching
	fire_action_pressed_label.text = fire_action_pressed_display_text % LaserManager.fire_action_pressed
