extends CharacterBody3D

var gravity = -9.8
@export var move_speed = 10
@export var jump_speed = 5
@export var sprint_speed = 18

@export var health = 100
@export var score = 0

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	var input = Input.get_vector("left","right","forward","backward")
	var direction = transform.basis * Vector3(input.x, 0, input.y)
	var speed = sprint_speed if Input.is_action_pressed("sprint") else move_speed
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	
	move_and_slide()
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * SettingsManager.look_sensitivity)
		$PlayerCamera.rotate_x(-event.relative.y * SettingsManager.look_sensitivity)
		$PlayerCamera.rotation.x = clampf($PlayerCamera.rotation.x, -deg_to_rad(70), deg_to_rad(70))

###
# Health and Score
###

func take_damage(amount:int):
	health -= amount

func earn_point():
	score += 1

func reset():
	health = 100
	score = 0
