extends Node3D

var speed := randi() % 5 + 5

signal car_death


func _ready() -> void:
	var gameState = get_node("/root/Game/GameState")
	car_death.connect(gameState._on_death)


func _process(delta: float) -> void:
	self.position += Vector3(-speed * delta, 0.0, 0.0)


func _on_area_3d_body_entered(body: Node3D) -> void:
	print(body)
	if body.name == "Character":
		car_death.emit()
