extends Node

@export var health = 10
@export var score = 0

var spawn_point = Vector3(0,0.5,0)

func take_damage():
	health -= 1

func earn_point():
	score += 1

func respawn(player:CharacterBody3D):
	if player:
		player.position = spawn_point

func reset():
	health = 10
	score = 0
