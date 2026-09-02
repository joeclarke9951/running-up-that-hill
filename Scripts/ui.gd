extends Control

var camera:Camera3D

func _ready() -> void:
	camera = get_parent() as Camera3D
	$GameTimerText.position = Vector2(GameManager.viewport_width/2, 0)
	$GameTimer.start(GameManager.round_time_seconds)


func _process(_delta: float) -> void:
	$GameTimerText.text = str(roundi($GameTimer.time_left))
	# TODO connect the UI to "the current player"
	$HealthText.text = str(GameManager.players[0].health)
	$ScoreText.text = str(GameManager.players[0].score)
	
