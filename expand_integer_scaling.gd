@tool
extends EditorPlugin

const AUTOLOAD := "IntegerScaler"

func _enable_plugin() -> void:
	# Add autoloads here.
	#add_custom_type("IntegerScaler", "Node", preload("res://addons/expand_integer_scaling/integer_scaler.gd"), preload("icon.png"))
	add_autoload_singleton(AUTOLOAD, "res://addons/expand_integer_scaling/integer_scaler.tscn")
	pass


func _disable_plugin() -> void:
	# Remove autoloads here.
	#remove_custom_type("IntegerScaler")
	remove_autoload_singleton(AUTOLOAD)
	pass


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	pass


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	pass
