extends Node3D

# eventually either make several spawns or a range of spawns
	# different objects will have different dimensions, if you use a Range you'll need to account for sizes
	# different Ranges that can each only spawn one object? and choose between them when it's time to spawn something?
	# calculate the range dynamically before the object appears?

@export var launch_speed = -5000
var trash:Array[PackedScene] = [null, null, null, null] # save each of the trash models here and pick one at random

func _ready() -> void:
	trash[0] = preload("res://PackedScenes/basic-trash-ball.tscn")
	trash[1] = preload("res://PackedScenes/basic-trash-barrel.tscn")
	trash[2] = preload("res://PackedScenes/basic-trash-cube.tscn")
	trash[3] = preload("res://PackedScenes/basic-trash-pole.tscn")
	

func spawn_trash(num:int):
	var t:RigidBody3D = trash[num].instantiate()
	var spawn_x = randf_range(-10, 10)
	var spawn_z = randf_range(-10, 0)
	t.position = Vector3(spawn_x, 10, spawn_z)
	t.rotation = Vector3(randf(),randf(),randf())
	add_child(t)
	t.apply_impulse(Vector3(0,launch_speed,0))


func _on_trash_timer_timeout() -> void:
	spawn_trash(randi_range(0,3))
