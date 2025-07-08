extends CharacterBody3D


func _on_game_state_on_death() -> void:
	queue_free()
