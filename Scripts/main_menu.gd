extends Node2D


func _on_start_button_button_down() -> void:
	get_tree().change_scene_to_file("res://Scenes/gameplay_scene.tscn")


func _on_settings_button_button_down() -> void:
	get_tree().change_scene_to_file("res://Scenes/settings_menu.tscn")


func _on_quit_button_button_down() -> void:
	get_tree().quit()
