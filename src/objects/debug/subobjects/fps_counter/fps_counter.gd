extends Label
var display_text: = text
func _process(_delta: float) -> void:
	text = display_text % Engine.get_frames_per_second()
