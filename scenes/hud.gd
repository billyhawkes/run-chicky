extends CanvasLayer

@onready var scoreLabel = $Score
@onready var deathScreen = $Death


func _on_game_state_score_changed(score: int) -> void:
	scoreLabel.text = str(score)


func _on_game_state_on_death() -> void:
	deathScreen.visible = true


func _on_back_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
