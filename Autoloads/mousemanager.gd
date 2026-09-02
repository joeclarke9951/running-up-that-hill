extends Node

func release_mouse():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func capture_mouse():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func toggle_mouse():
	release_mouse() if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED else capture_mouse()
