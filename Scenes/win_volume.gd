extends Area3D


func _on_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:
		GameManager.earn_point()
		GameManager.respawn(body)
	else: # it's a trash object
		pass
