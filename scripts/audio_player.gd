extends Node3D

@onready var SFX_Jump: AudioStreamPlayer = $SFX_Jump
@onready var SFX_Music: AudioStreamPlayer = $SFX_Music


func play_jump() -> void:
	SFX_Jump.play()


func increase_music_pitch() -> void:
	SFX_Music.pitch_scale += 0.001


func reset_music_pitch() -> void:
	SFX_Music.pitch_scale = 1.0
