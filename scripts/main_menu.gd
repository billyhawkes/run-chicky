extends CanvasLayer

var game_scene = preload("res://scenes/game.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(game_scene)
