class_name Player extends CharacterBody3D

@export var move_speed = 10
@export var jump_speed = 5
@export var sprint_speed = 18
@export var is_sprinting = false

@export var health = 100
@export var score = 0

###
# Overrides
###

func _ready() -> void:
	GameManager.set_player(self, 0)
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(_delta: float) -> void:
	# if controller is connected:
	if len(Input.get_connected_joypads()) > 0:
		var right_stick_horizontal = Input.get_axis("look_right", "look_left") * 10
		var right_stick_vertical = Input.get_axis("look_up", "look_down") * 7.5
		rotate_y(right_stick_horizontal * SettingsManager.controller_look_sensitivity)
		$PlayerCamera.rotate_x(-right_stick_vertical * SettingsManager.controller_look_sensitivity)
		$PlayerCamera.rotation.x = clampf($PlayerCamera.rotation.x, -deg_to_rad(70), deg_to_rad(70))

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("sprint"):
		is_sprinting = !is_sprinting
	velocity.y += GameManager.gravity * delta
	var input = Input.get_vector("left","right","forward","backward")
	var direction = transform.basis * Vector3(input.x, 0, input.y)
	var speed = sprint_speed if is_sprinting else move_speed
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
