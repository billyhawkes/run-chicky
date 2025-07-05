extends Node

var car: PackedScene = load("res://scenes/car.tscn")
var t := 0.0
var duration := randi() % 5 + 5


func _process(delta: float) -> void:
	t += delta / duration

	if t > 1:
		t = 0
		var newCar = car.instantiate()
		newCar.scale = Vector3(0.5, 0.5, 0.5)
		add_child(newCar)
