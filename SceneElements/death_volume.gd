extends Area3D


func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		body.take_damage(100)
		GameManager.respawn(body)
	else: # it's a trash object
		pass
