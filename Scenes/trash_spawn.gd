extends Node3D

# preload the trash object(s)
# write a function to spawn them in at the spawn position
# eventually either make several spawns or a range of spawns
	# different objects will have different dimensions, if you use a Range you'll need to account for sizes
	# different Ranges that can each only spawn one object? and choose between them when it's time to spawn something?
	# calculate the range dynamically before the object appears?

var trash:Array[PackedScene] = [null]

func _ready() -> void:
	trash[0] = preload("res://PackedScenes/basic-trash-object.tscn")
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("debug"):
		spawn_trash(0)

func spawn_trash(num:int):
	var t:Node3D = trash[num].instantiate()
	t.position = Vector3(0, 10, -5)
	t.rotation = Vector3(randf(),randf(),randf())
	add_child(t)
