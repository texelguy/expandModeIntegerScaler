@tool
extends EditorPlugin

const AUTOLOAD := "IntegerScaler"
const SETTING_PATH := "IntegerScaler/settings/base_resolution"
const DEFAULT_VALUE := Vector2(320, 180)

func _enter_tree() -> void:
	# Add autoloads here.
	add_autoload_singleton(AUTOLOAD, "res://addons/expand_integer_scaling/integer_scaler.tscn")
	if not ProjectSettings.has_setting(SETTING_PATH):
		ProjectSettings.set_setting(SETTING_PATH, DEFAULT_VALUE)
	
	var property_info = {
		"name": SETTING_PATH,
		"type": TYPE_VECTOR2I,
	}
	
	ProjectSettings.add_property_info(property_info)
	
	ProjectSettings.set_initial_value(SETTING_PATH, DEFAULT_VALUE)
	ProjectSettings.save()
	

func _exit_tree() -> void:
	# Remove autoloads here.
	remove_autoload_singleton(AUTOLOAD)
	pass
