extends Node3D

var speed := 5

signal car_death

var gameState
@onready var SFX_Car: AudioStreamPlayer3D = $SFX_Car


func _ready() -> void:
	gameState = get_node("/root/Game/GameState")
	SFX_Car.play()
	car_death.connect(gameState._on_death)


func _process(delta: float) -> void:
	speed = 5 + max(gameState.score, 1) / 5
	self.position += Vector3(-speed * delta, 0.0, 0.0)


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Character":
		car_death.emit()
