extends CanvasLayer

@onready var scoreLabel = $Score


func _on_game_state_score_changed(score: int) -> void:
	scoreLabel.text = str(score)
