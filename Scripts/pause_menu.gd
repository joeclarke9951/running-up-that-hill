extends Control


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused = !get_tree().paused
		visible = !visible
		MouseManager.toggle_mouse()


func _on_resume_button_button_down() -> void:
	visible = false
	get_tree().paused = false
	MouseManager.capture_mouse()


func _on_quit_button_button_down() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
