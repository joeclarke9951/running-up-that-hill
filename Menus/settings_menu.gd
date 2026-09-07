extends Node2D

func _ready() -> void:
	$Camera2D/VBoxContainer/MouseSensitivitySlider.value = SettingsManager.look_sensitivity
	$Camera2D/VBoxContainer/ControllerSensitivitySlider.value = SettingsManager.controller_look_sensitivity

func _on_back_button_button_down() -> void:
	get_tree().change_scene_to_file("res://Menus/main_menu.tscn")


func _on_sensitivity_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		SettingsManager.look_sensitivity = $Camera2D/VBoxContainer/MouseSensitivitySlider.value


func _on_controller_sensitivity_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		SettingsManager.look_sensitivity = $Camera2D/VBoxContainer/ControllerSensitivitySlider.value
