extends Node

var spawn_point = Vector3(0,0.5,0)

func respawn(player:CharacterBody3D):
	if player:
		player.position = spawn_point
	player.health = 100
