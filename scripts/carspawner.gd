extends Node

var gameState
var car: PackedScene = load("res://scenes/car.tscn")

var t := 0.5
var duration := randi() % 5 + 2


func _ready() -> void:
	gameState = get_node("/root/Game/GameState")


func _process(delta: float) -> void:
	t += delta / duration

	if t > 1:
		duration = max((randi() % 15 + 2) - (max(gameState.score, 1) / 10), 3)
		t = 0
		var newCar = car.instantiate()
		add_child(newCar)
