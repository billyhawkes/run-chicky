extends Node3D

@onready var SFX_Jump: AudioStreamPlayer = $SFX_Jump


func play_jump() -> void:
	SFX_Jump.play()
