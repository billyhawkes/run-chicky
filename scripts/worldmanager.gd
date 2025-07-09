extends Node3D

var road = preload("res://assets/meshes/road.res")
var grass = preload("res://assets/meshes/grass.res")
var tree = preload("res://assets/meshes/tree.res")
var car_script = preload("res://scripts/carspawner.gd")

@onready var gameState = %GameState

const lane_length = 15
const middle = floor(float(lane_length) / 2)
var lane_index = 0

signal moved


func init_lane() -> void:
	var newLane = Node3D.new()
	var laneType = lane_index % max(floor(gameState.score / 5), 2)
	lane_index += 1
	for x in lane_length:
		var newMesh = MeshInstance3D.new()
		var pos = Vector3(4 * x - (4 * middle), 0, 4 * lane_index - (4 * middle))
		if laneType == 0:
			newMesh.mesh = grass
			if randi() % 2 == 0 && x != middle:
				var treeMesh = MeshInstance3D.new()
				treeMesh.mesh = tree
				treeMesh.position = pos
				treeMesh.rotate_y(randi() % 180)
				newLane.add_child(treeMesh)
		else:
			newMesh.mesh = road
			if x == lane_length - 1:
				newMesh.set_script(car_script)

		newMesh.scale = Vector3(2, 2, 2)
		newMesh.position = pos
		newLane.add_child(newMesh)
	add_child(newLane)


func _ready() -> void:
	for z in 30:
		init_lane()


var start := 0.0
var end := 0.0
var t := 1.0
var duration := 0.2


func easeInOutSine(x: float) -> float:
	return -(cos(PI * x) - 1) / 2


func _process(delta: float) -> void:
	if t < 1.0:
		t += delta / duration
		self.position.z = lerp(start, end, easeInOutSine(t))

	if Input.is_action_just_pressed("jump") && t >= 1.0 && gameState.dead == false:
		AudioPlayer.play_jump()
		AudioPlayer.increase_music_pitch()
		t = 0
		moved.emit()
		start = self.position.z
		end = self.position.z - 4
		init_lane()

		var first_child = self.get_children()[0]
		self.remove_child(first_child)
		first_child.queue_free()
