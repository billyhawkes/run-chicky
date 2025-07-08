extends Node3D

var score := 0
var dead := false

signal score_changed(score: int)
signal on_death


func _on_world_moved() -> void:
	score += 1
	score_changed.emit(score)


func _on_death() -> void:
	dead = true
	on_death.emit()
