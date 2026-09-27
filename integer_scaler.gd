extends Node


var BASE_WIDTH: int = 180
var BASE_HEIGHT: int = 320

func _ready() -> void:
	var base_resolution: Vector2 = ProjectSettings.get_setting("IntegerScaler/settings/base_resolution")
	BASE_WIDTH = base_resolution.x
	BASE_HEIGHT = base_resolution.y
	ProjectSettings.settings_changed.connect(_on_settings_changed)
	
	get_tree().root.size_changed.connect(_on_window_resized)
	_on_window_resized()

func _on_window_resized() -> void:
	var window_size := get_tree().root.size
	
	var scale_x: int = window_size.x / BASE_WIDTH
	var scale_y: int = window_size.y / BASE_HEIGHT
	var scale_factor: int = max(1, min(scale_x, scale_y))
	
	var target_width: int = window_size.x / scale_factor
	var target_height: int = window_size.y / scale_factor
	
	get_viewport().content_scale_size = Vector2i(target_width, target_height)

func _on_settings_changed() -> void:
	var base_resolution: Vector2 = ProjectSettings.get_setting("IntegerScaler/settings/base_resolution")
	BASE_WIDTH = base_resolution.x
	BASE_HEIGHT = base_resolution.y
