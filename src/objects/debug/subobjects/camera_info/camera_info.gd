extends VBoxContainer
@onready var velocity_label: Label = $Velocity
@onready var velocity_display_text: = velocity_label.text
func _process(_delta: float) -> void:
	velocity_label.text = velocity_display_text % snapped(Camera.velocity, 0.1)
