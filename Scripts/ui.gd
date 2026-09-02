extends Control

var camera:Camera3D

func _ready() -> void:
	camera = get_parent() as Camera3D


func _process(_delta: float) -> void:
	# TODO connect the UI to "the current player"
	$HealthText.text = str(GameManager.players[0].health)
	$ScoreText.text = str(GameManager.players[0].score)
