extends CharacterBody3D

var speed := randi() % 5 + 5


func _physics_process(delta: float) -> void:
	var collision := move_and_collide(Vector3(-speed * delta, 0.0, 0.0))

	if collision != null:
		var body := collision.get_collider()
		print("Collided with: ", body.name)
