extends Control

var camera:Camera3D

func _ready() -> void:
	camera = get_parent() as Camera3D


func _process(_delta: float) -> void:
	$HealthText.text = str(GameManager.health)
	$ScoreText.text = str(GameManager.score)
