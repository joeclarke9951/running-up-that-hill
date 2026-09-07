extends Node2D

func _ready() -> void:
	$Camera2D/VBoxContainer/BackButton.grab_focus.call_deferred()

func _on_back_button_button_down() -> void:
	get_tree().change_scene_to_file("res://Menus/main_menu.tscn")
