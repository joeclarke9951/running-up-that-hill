extends Area3D


func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		body.take_damage(100)
		GameManager.respawn(body)
	elif body is RigidBody3D: # it's trash
		body.queue_free()
	else: #unrecognised
		pass
