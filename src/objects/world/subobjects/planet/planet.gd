extends Area3D
class_name Planet


func _ready() -> void:
	print("ready up")
	var _t = mouse_entered.connect(_on_mouse_entered)
	_t = mouse_exited.connect(_on_mouse_exited)


func _on_mouse_entered() -> void:
	PlanetData.mouse_touching_planet = true
	print("mouse entered")


func _on_mouse_exited() -> void:
	PlanetData.mouse_touching_planet = false
	print("mouse exited")