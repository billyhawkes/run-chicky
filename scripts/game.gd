extends Node3D

var score := 0

signal score_changed(score: int)


func _on_world_moved() -> void:
	score += 1
	score_changed.emit(score)
