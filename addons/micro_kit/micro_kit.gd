@tool
extends EditorPlugin


func _enter_tree():
	# Initialization of the plugin goes here.
	add_custom_type("MicroGameManager", "Node2D", preload("game_manager.gd"), preload("res://assets/icon.svg"))


func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_custom_type("MicroGameManager")
